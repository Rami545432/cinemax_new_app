import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../repos/auth_repo.dart';

class CheckAuthStatusUseCase implements UseCase<bool, NoParams> {
  final AuthRepo repository;

  CheckAuthStatusUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call([NoParams? parameter]) async {
    return await repository.checkAuthStatus();
  }
}
