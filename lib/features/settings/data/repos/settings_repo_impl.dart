import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:movify/features/settings/domain/repos/settings_repo.dart';

@LazySingleton(as: SettingsRepo)
class SettingsRepoImpl implements SettingsRepo {
  final SettingsLocalDataSource localDataSource;

  SettingsRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> getIsFirstTime() async {
    try {
      final isFirstTime = await localDataSource.getIsFirstTime();
      return right(isFirstTime);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setIsFirstTime(bool value) async {
    try {
      await localDataSource.setIsFirstTime(value);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
