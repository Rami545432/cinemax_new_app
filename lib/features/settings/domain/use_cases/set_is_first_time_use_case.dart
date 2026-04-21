import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/settings/domain/repos/settings_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetIsFirstTimeUseCase implements UseCase<void, bool> {
  final SettingsRepo repository;

  SetIsFirstTimeUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([bool? params]) =>
      repository.setIsFirstTime(params ?? false);
}
