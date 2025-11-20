import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../repos/auth_repo.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepo repository;

  SignOutUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call([NoParams? parameter]) async {
    return await repository.signOut();
  }
}
