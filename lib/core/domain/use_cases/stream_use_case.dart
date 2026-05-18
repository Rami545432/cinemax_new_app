abstract interface class StreamUseCase<T, Parameter> {
  Stream<T> call([Parameter parameter]);
}
