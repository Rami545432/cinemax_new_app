import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/errors/errors.dart';

Future<Either<Failure, T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return right(result);
  } on DioException catch (e) {
    return left(ServerFailure.fromDioError(e));
  } catch (e) {
    return left(ServerFailure(errorMessage: 'Unexpected error: $e'));
  }
}
