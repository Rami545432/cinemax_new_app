class PagedResult<T> {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  const PagedResult({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  bool get hasMore => page < totalPages;
}
