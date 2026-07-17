import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/domain/repos/auth_repo.dart';

class DisableGuestModeUseCase implements UseCase<void, NoParams> {
  final AuthRepo repository;
  DisableGuestModeUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call([NoParams? parameter]) =>
      repository.disableGuestMode();
}
