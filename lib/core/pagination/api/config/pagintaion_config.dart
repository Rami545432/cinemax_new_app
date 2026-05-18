class PaginationConfig {
  final int itemsPerPage;
  final double loadMoreThreshold;
  final bool showPaginationLoader;

  PaginationConfig({
    this.itemsPerPage = 20,
    this.loadMoreThreshold = 0.8,
    this.showPaginationLoader = true,
  });
}
