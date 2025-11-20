import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class IsGuestModeUseCase implements UseCase<bool, NoParams> {
  final AuthRepo repository;
  IsGuestModeUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call([NoParams? parameter]) async {
    return await repository.isGuestMode();
  }
}
