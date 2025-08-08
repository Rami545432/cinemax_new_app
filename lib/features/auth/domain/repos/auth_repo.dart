import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/errors.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoolge();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, void>> updateDisplayName({required String name});
  Future<Either<Failure, void>> verficationEmailBeforeUpdated({
    required String email,
  });
}
