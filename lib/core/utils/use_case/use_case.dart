import '../../types/repository_types.dart';

abstract class UseCase<Type, Parameter> {
  UseCaseResult<Type> call([Parameter parameter]);
}

class NoParams {}
