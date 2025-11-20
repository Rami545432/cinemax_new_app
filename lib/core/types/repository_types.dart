import 'package:dartz/dartz.dart';

import '../utils/errors/errors.dart';

typedef RepositoryResult<T> = Future<Either<Failure, T>>;
typedef ListRepositoryResult<T> = RepositoryResult<List<T>>;
typedef UseCaseResult<T> = RepositoryResult<T>;
