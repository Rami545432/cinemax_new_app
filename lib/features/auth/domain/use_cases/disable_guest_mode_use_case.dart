import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DisableGuestModeUseCase implements UseCase<void, NoParams> {
  final AuthRepo repository;
  DisableGuestModeUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call([NoParams? parameter]) =>
      repository.disableGuestMode();
}
