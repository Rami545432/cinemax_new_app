import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';

abstract interface class SettingsRepo {
  Future<Either<Failure, bool>> getIsFirstTime();
  Future<Either<Failure, void>> setIsFirstTime(bool value);
}
