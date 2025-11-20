import 'package:equatable/equatable.dart';

abstract class BasePaginatedStates<T> extends Equatable {
  const BasePaginatedStates();
}

class BasePaginatedLoading<T> extends BasePaginatedStates<T> {
  final List<T> oldData;
  final bool isFirstFetch;
  @override
  List<Object?> get props => [oldData, isFirstFetch];
  const BasePaginatedLoading({
    required this.oldData,
    required this.isFirstFetch,
  });
}

class BasePaginatedSuccess<T> extends BasePaginatedStates<T> {
  final List<T> newData;
  final bool isLastPage;
  @override
  List<Object?> get props => [newData, isLastPage];
  const BasePaginatedSuccess({required this.newData, required this.isLastPage});
}

class BasePaginatedError<T> extends BasePaginatedStates<T> {
  final String errorMessage;
  final List<T> oldData;
  @override
  List<Object?> get props => [errorMessage, oldData];
  const BasePaginatedError({required this.errorMessage, required this.oldData});
}

class BasePaginatedInitial<T> extends BasePaginatedStates<T> {
  @override
  List<Object?> get props => [];
  const BasePaginatedInitial();
}
