import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, bool>> checkAuthStatus();
  Future<Either<Failure, UserEntity>> enableGuestMode();
  Future<Either<Failure, void>> disableGuestMode();
  Future<Either<Failure, bool>> isGuestMode();
}
