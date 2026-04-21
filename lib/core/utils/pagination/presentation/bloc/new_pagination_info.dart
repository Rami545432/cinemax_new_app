import 'package:equatable/equatable.dart';

class PaginationInfo<T, P> extends Equatable {
  final List<T> items;
  final P? params;
  final int currentPage;
  final int totalPages;
  final int totalResults;

  /// First page is loading — show full area spinner
  final bool isFetchingFirstPage;

  /// Next page is loading — show bottom row spinner
  final bool isFetchingMore;

  /// First page failed — show error widget in the category area
  final String? firstPageError;

  /// Next page failed — keep list, show retry at bottom
  final String? fetchMoreError;

  const PaginationInfo({
    this.items = const [],
    this.params,
    this.currentPage = 0,
    this.totalPages = 1,
    this.totalResults = 0,
    this.isFetchingFirstPage = false,
    this.isFetchingMore = false,
    this.firstPageError,
    this.fetchMoreError,
  });

  // ── Derived getters — UI reads these, never checks flags directly ──

  /// True when first load and no items yet
  bool get isFirstLoad => items.isEmpty && isFetchingFirstPage;

  /// Safe to request another page
  bool get canLoadMore =>
      !isFetchingFirstPage &&
      !isFetchingMore &&
      firstPageError == null &&
      currentPage < totalPages;

  /// Has any error at all
  bool get hasError => firstPageError != null || fetchMoreError != null;

  /// Loaded at least once successfully
  bool get hasData => items.isNotEmpty;

  /// Human-readable count e.g. "20 of 340"
  String get countLabel => '${items.length} of $totalResults';

  // ── copyWith ──────────────────────────────────────────────────────
  PaginationInfo<T, P> copyWith({
    List<T>? items,
    P? params,
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? isFetchingFirstPage,
    bool? isFetchingMore,
    String? firstPageError,   // pass null explicitly to clear
    String? fetchMoreError,   // pass null explicitly to clear
  }) =>
      PaginationInfo(
        items: items ?? this.items,
        params: params ?? this.params,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
        isFetchingFirstPage: isFetchingFirstPage ?? this.isFetchingFirstPage,
        isFetchingMore: isFetchingMore ?? this.isFetchingMore,
        firstPageError: firstPageError,
        fetchMoreError: fetchMoreError,
      );

  @override
  List<Object?> get props => [
        items,
        params,
        currentPage,
        totalPages,
        totalResults,
        isFetchingFirstPage,
        isFetchingMore,
        firstPageError,
        fetchMoreError,
      ];
}
