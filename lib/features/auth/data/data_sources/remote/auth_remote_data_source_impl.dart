import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movify/core/errors/expections.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movify/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firestore,
  });

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // Await authStateChanges().first to ensure the Firebase SDK has
      // finished restoring the session from local storage on app boot.
      // This prevents the race condition where currentUser is null immediately after initializeApp.
      final user = await firebaseAuth.authStateChanges().first;
      if (user == null) {
        return null;
      }
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(
        errorMessage: e.message ?? 'Failed to get current user',
      );
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw CancelledException();
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user == null) {
        throw const ServerFailure(errorMessage: 'Google sign in failed');
      }
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(errorMessage: e.message ?? 'An error occurred');
    } on CancelledException catch (e) {
      throw CancelledException(e.message);
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(errorMessage: e.message ?? 'An error occurred');
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<void> deleteUserAccount() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        // 1. Delete all Firestore data (Favorites) first
        final userDocRef = firestore.collection('users').doc(user.uid);
        final favoritesRef = userDocRef.collection('favorites');

        final snapshots = await favoritesRef.get();
        final batch = firestore.batch();
        for (final doc in snapshots.docs) {
          batch.delete(doc.reference);
        }
        // Also delete the parent user document itself
        batch.delete(userDocRef);
        await batch.commit();

        // 2. Finally, delete the Firebase Auth account
        try {
          await user.delete();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'requires-recent-login') {
            // Re-authenticate the user silently
            final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
            if (googleUser != null) {
              final GoogleSignInAuthentication googleAuth =
                  await googleUser.authentication;
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              );
              await user.reauthenticateWithCredential(credential);
              await user.delete(); // Try deleting again after re-auth
            } else {
              throw const ServerFailure(
                errorMessage:
                    'Re-authentication is required to delete your account. Please try logging in again.',
              );
            }
          } else {
            rethrow;
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(errorMessage: e.message ?? 'An error occurred');
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
