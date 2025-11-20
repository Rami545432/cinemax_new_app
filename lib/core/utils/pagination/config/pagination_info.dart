import 'package:equatable/equatable.dart';

/// T = Item/Entity type

class PaginationInfo<T> extends Equatable {
  final List<T> items;
  final int currentPage;
  final bool isLastPage;
  final bool isFetching;
  final String? error;
  const PaginationInfo({
    this.items = const [],
    this.currentPage = 1,
    this.isLastPage = false,
    this.isFetching = false,
    this.error,
  });
  PaginationInfo<T> copyWith({
    List<T>? items,
    int? currentPage,
    bool? isLastPage,
    bool? isFetching,
    String? error,
  }) {
    return PaginationInfo<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isFetching: isFetching ?? this.isFetching,
      error: error ?? this.error,
    );
  }

  bool get hasData => items.isNotEmpty;
  bool get isInitialLoad => items.isEmpty && currentPage == 1;
  bool get canLoadMore => !isLastPage && !isFetching;
  bool get hasErrorWithNoData => error != null && items.isEmpty;

  @override
  List<Object?> get props => [
    items,
    currentPage,
    isLastPage,
    isFetching,
    error,
  ];
}
