import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        return null;
      }
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? 'Failed to get current user');
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw ServerFailure(errorMessage: 'Google sign in failed');
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
        throw ServerFailure(errorMessage: 'Google sign in failed');
      }
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw ServerFailure(errorMessage: e.message ?? 'An error occurred');
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
}
