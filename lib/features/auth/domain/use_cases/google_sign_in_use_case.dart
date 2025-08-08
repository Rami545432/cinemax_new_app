import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repo.dart';

class GoogleSignInUseCase extends UseCase<UserEntity, NoParam> {
  final AuthRepo authRepo;

  GoogleSignInUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserEntity>> call([NoParam? parameter]) async {
    return await authRepo.signInWithGoolge();
  }
}
