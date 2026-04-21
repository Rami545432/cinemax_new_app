class PageResult<T> {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  const PageResult({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  bool get hasMore => page < totalPages;

  /// Transform items while preserving pagination metadata
  PageResult<R> map<R>(R Function(T) transform) => PageResult<R>(
    page: page,
    totalPages: totalPages,
    totalResults: totalResults,
    results: results.map(transform).toList(),
  );
}
