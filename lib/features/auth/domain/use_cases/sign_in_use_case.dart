import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repo.dart';

class SignInUseCase extends UseCase<UserEntity, String> {
  final AuthRepo authRepo;

  SignInUseCase({required this.authRepo});
  @override
  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, UserEntity>> call([
    String? parameter,
    String? password,
  ]) async {
    return await authRepo.signIn(email: parameter!, password: password!);
  }
}
