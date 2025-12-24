import 'package:equatable/equatable.dart';

/// T = Item/Entity type

class PaginationInfo<T, P> extends Equatable {
  final List<T> items;
  final int currentPage;
  final bool isLastPage;
  final bool isFetching;
  final String? error;
  final P? params;
  final int? totalPages;
  final int? totalResults;
  const PaginationInfo({
    this.items = const [],
    this.currentPage = 1,
    this.isLastPage = false,
    this.isFetching = false,
    this.error,
    this.params,
    this.totalPages,
    this.totalResults,
  });
  PaginationInfo<T, P> copyWith({
    List<T>? items,
    int? currentPage,
    bool? isLastPage,
    bool? isFetching,
    String? error,
    P? params,
    int? totalPages,
    int? totalResults,
  }) {
    return PaginationInfo<T, P>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isFetching: isFetching ?? this.isFetching,
      error: error ?? this.error,
      params: params ?? this.params,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  bool get hasData => items.isNotEmpty;
  bool get isInitialLoad => items.isEmpty && currentPage == 1;
  bool get canLoadMore =>
      !isLastPage && !isFetching && totalPages != currentPage;
  bool get hasErrorWithNoData => error != null && items.isEmpty;

  @override
  List<Object?> get props => [
    items,
    currentPage,
    isLastPage,
    isFetching,
    error,
    params,
    totalPages,
    totalResults,
  ];
}
