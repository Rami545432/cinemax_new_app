import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

typedef RepositoryResult<T> = Future<Either<Failure, T>>;
typedef ListRepositoryResult<T> = RepositoryResult<List<T>>;
typedef UseCaseResult<T> = RepositoryResult<T>;
