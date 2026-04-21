import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract interface class SettingsRepo {
  Future<Either<Failure, bool>> getIsFirstTime();
  Future<Either<Failure, void>> setIsFirstTime(bool value);
}
