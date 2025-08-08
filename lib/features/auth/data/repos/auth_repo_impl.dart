import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
  final fireBaseUser = FirebaseAuth.instance;
  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final fireBaseUser = userCredential.user;

      if (fireBaseUser != null) {
        final userData = UserEntity(
          email: fireBaseUser.email!,
          id: fireBaseUser.uid,
          emailVerify: fireBaseUser.emailVerified,
        );
        return right(userData);
      } else {
        return left(FireBaseFailure(errorMessage: 'User not found'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FireBaseFailure.fromAuthException(e));
      }
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final fireBaseUser = userCredential.user;

      if (fireBaseUser != null) {
        final userData = UserEntity(
          email: fireBaseUser.email!,
          id: fireBaseUser.uid,
          emailVerify: fireBaseUser.emailVerified,
        );
        return right(userData);
      } else {
        return left(FireBaseFailure(errorMessage: 'User not found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(
        FireBaseFailure(errorMessage: e.message ?? 'An error occurred'),
      );
    } catch (e) {
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoolge() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      var fireBaseUser = userCredential.user;
      if (fireBaseUser != null) {
        final userdata = UserEntity(
          emailVerify: fireBaseUser.emailVerified,
          email: fireBaseUser.email!,
          id: fireBaseUser.uid,
        );
        log(fireBaseUser.uid);
        return right(userdata);
      } else {
        return left(FireBaseFailure(errorMessage: 'User Not Found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FireBaseFailure.fromAuthException(e));
    } catch (e) {
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      UserCredential userCredential = await _firebaseAuth.signInWithCredential(
        facebookAuthCredential,
      );

      var fireBaseUser = userCredential.user;
      if (fireBaseUser != null) {
        final userData = await FacebookAuth.instance.getUserData(
          fields: "id,name,picture.width(200)",
        );
        final String profilePictureUrl = userData['picture']['data']['url'];
        final userdata = UserEntity(
          emailVerify: fireBaseUser.emailVerified,
          email: fireBaseUser.email ?? fireBaseUser.uid,
          id: fireBaseUser.uid,
        );
        log(fireBaseUser.uid);
        _firebaseAuth.currentUser!.updatePhotoURL(profilePictureUrl);
        return right(userdata);
      } else {
        return left(FireBaseFailure(errorMessage: 'User Not Found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FireBaseFailure.fromAuthException(e));
    } catch (e) {
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDisplayName({
    required String name,
  }) async {
    try {
      final newName = await fireBaseUser.currentUser!.updateDisplayName(name);
      return right(newName);
    } catch (e) {
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verficationEmailBeforeUpdated({
    required String email,
  }) async {
    try {
      final newEmail = await fireBaseUser.currentUser!.verifyBeforeUpdateEmail(
        email,
      );
      return right(newEmail);
    } catch (e) {
      return left(FireBaseFailure(errorMessage: e.toString()));
    }
  }
}
