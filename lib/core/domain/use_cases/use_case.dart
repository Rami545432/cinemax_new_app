import 'package:movify/core/types/repository_types.dart';

abstract interface class UseCase<T, Parameter> {
  UseCaseResult<T> call([Parameter parameter]);
}
