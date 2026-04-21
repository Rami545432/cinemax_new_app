import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/settings/domain/repos/settings_repo.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetIsFirstTimeUseCase implements UseCase<bool, NoParams> {
  final SettingsRepo repository;

  GetIsFirstTimeUseCase(this.repository);

  @override
  @override
  Future<Either<Failure, bool>> call([NoParams? params]) =>
      repository.getIsFirstTime();
}
