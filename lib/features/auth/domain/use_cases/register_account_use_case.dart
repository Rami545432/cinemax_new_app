import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repo.dart';

class SignUpUseCase extends UseCase<UserEntity, String> {
  final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, UserEntity>> call([String? email, String? password]) {
    return authRepo.signUp(email: email!, password: password!);
  }
}
