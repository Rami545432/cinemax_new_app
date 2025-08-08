import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call([Parameter parameter]);
}

class NoParam {}
