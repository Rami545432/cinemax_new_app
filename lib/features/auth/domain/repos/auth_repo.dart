import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> continueAsGuest();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, bool>> checkAuthStatus();
  Future<Either<Failure, UserEntity>> enableGuestMode();
  Future<Either<Failure, void>> disableGuestMode();
  Future<Either<Failure, bool>> isGuestMode();
}
