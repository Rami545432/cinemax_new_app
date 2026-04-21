sealed class CategoryPaginationEvent<CAT, P> {
  const CategoryPaginationEvent();
}

/// Initial load or forceRefresh for one category
class LoadCategoryEvent<CAT, P> extends CategoryPaginationEvent<CAT, P> {
  final CAT category;
  final bool forceRefresh;

  const LoadCategoryEvent(this.category, {this.forceRefresh = false});
}

/// Scroll hit the bottom — fetch next page
class LoadNextPageEvent<CAT, P> extends CategoryPaginationEvent<CAT, P> {
  final CAT category;

  const LoadNextPageEvent(this.category);
}

/// User changed filters — reset + reload
class UpdateParamsEvent<CAT, P> extends CategoryPaginationEvent<CAT, P> {
  final CAT category;
  final P params;

  const UpdateParamsEvent(this.category, this.params);
}

/// Load all categories in parallel
class LoadAllCategoriesEvent<CAT, P> extends CategoryPaginationEvent<CAT, P> {
  const LoadAllCategoriesEvent();
}
