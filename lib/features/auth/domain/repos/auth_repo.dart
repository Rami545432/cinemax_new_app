import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, UserEntity?>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, UserEntity>> enableGuestMode();
  Future<Either<Failure, void>> disableGuestMode();
  Future<Either<Failure, bool>> isGuestMode();
  Future<Either<Failure, void>> deleteUserAccount();
}
