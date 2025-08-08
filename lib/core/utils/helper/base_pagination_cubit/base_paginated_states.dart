abstract class BasePaginatedStates<T> {
  const BasePaginatedStates();
}

class BasePaginatedLoading<T> extends BasePaginatedStates<T> {
  final List<T> oldData;
  final bool isFirstFetch;
  BasePaginatedLoading({required this.oldData, required this.isFirstFetch});
}

class BasePaginatedSuccess<T> extends BasePaginatedStates<T> {
  final List<T> newData;
  final bool isLastPage;
  BasePaginatedSuccess({required this.newData, required this.isLastPage});
}

class BasePaginatedError<T> extends BasePaginatedStates<T> {
  final String errorMessage;
  final List<T> oldData;
  BasePaginatedError({required this.errorMessage, required this.oldData});
}

class BasePaginatedInitial<T> extends BasePaginatedStates<T> {}
