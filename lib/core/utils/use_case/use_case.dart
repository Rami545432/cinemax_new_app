import '../../types/repository_types.dart';

abstract class UseCase<T, Parameter> {
  UseCaseResult<T> call([Parameter parameter]);
}

class NoParams {}
