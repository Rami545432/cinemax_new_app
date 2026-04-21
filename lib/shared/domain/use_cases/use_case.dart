import 'package:cinemax_app_new/core/types/repository_types.dart';

abstract interface class UseCase<T, Parameter> {
  UseCaseResult<T> call([Parameter parameter]);
}

class NoParams {}
