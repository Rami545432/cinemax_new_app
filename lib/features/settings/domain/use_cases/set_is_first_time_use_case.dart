import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/use_case.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/settings/domain/repos/settings_repo.dart';

class SetIsFirstTimeUseCase implements UseCase<void, bool> {
  final SettingsRepo repository;

  SetIsFirstTimeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([bool? params]) =>
      repository.setIsFirstTime(params ?? false);
}
