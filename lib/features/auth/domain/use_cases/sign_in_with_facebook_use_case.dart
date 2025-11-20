import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';
import '../repos/auth_repo.dart';

class SignInWithFacebookUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepo authRepo;

  SignInWithFacebookUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserEntity>> call([NoParams? parameter]) async {
    return await authRepo.signInWithFacebook();
  }
}
