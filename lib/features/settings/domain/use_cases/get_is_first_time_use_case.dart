import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/settings/domain/repos/settings_repo.dart';

class GetIsFirstTimeUseCase implements UseCase<bool, NoParams> {
  final SettingsRepo repository;

  GetIsFirstTimeUseCase(this.repository);

  @override
  @override
  Future<Either<Failure, bool>> call([NoParams? params]) =>
      repository.getIsFirstTime();
}
