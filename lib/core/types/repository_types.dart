import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';

typedef RepositoryResult<T> = Future<Either<Failure, T>>;
typedef ListRepositoryResult<T> = RepositoryResult<List<T>>;
typedef UseCaseResult<T> = RepositoryResult<T>;
