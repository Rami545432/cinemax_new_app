import 'package:cinemax_app_new/core/utils/pagination/config/pagination_info.dart';
import 'package:equatable/equatable.dart';

/// C = Category enum type
/// T = Item/Entity type
abstract class CategoryPaginationState<C, T, P> extends Equatable {
  const CategoryPaginationState();
  @override
  List<Object?> get props => [];
}

class CategoryPaginationInitial<C, T, P>
    extends CategoryPaginationState<C, T, P> {}

class CategoryPaginationLoading<C, T, P>
    extends CategoryPaginationState<C, T, P> {}

class CategoryPaginationLoaded<C, T, P>
    extends CategoryPaginationState<C, T, P> {
  final Map<C, PaginationInfo<T, P>> categoriesData;

  const CategoryPaginationLoaded({required this.categoriesData});
  @override
  List<Object?> get props => [categoriesData];
  PaginationInfo<T, P> getPaginationInfo(C category) {
    return categoriesData[category] ?? PaginationInfo<T, P>();
  }

  List<T> getItems(C category) {
    return getPaginationInfo(category).items;
  }

  bool isLoading(C category) {
    return getPaginationInfo(category).isFetching;
  }

  bool canLoadMore(C category) {
    return getPaginationInfo(category).canLoadMore;
  }

  int getTotalPages(C category) {
    return getPaginationInfo(category).totalPages ?? 0;
  }

  int getTotalResults(C category) {
    return getPaginationInfo(category).totalResults ?? 0;
  }

  bool isInitialLoad(C category) {
    return getPaginationInfo(category).isInitialLoad;
  }

  bool hasData(C category) {
    return getPaginationInfo(category).hasData;
  }

  String? getError(C category) {
    return getPaginationInfo(category).error;
  }

  CategoryPaginationLoaded<C, T, P> copyWithCategory({
    required C category,
    required PaginationInfo<T, P> paginationInfo,
  }) {
    final newData = Map<C, PaginationInfo<T, P>>.from(categoriesData);
    newData[category] = paginationInfo;
    return CategoryPaginationLoaded(categoriesData: newData);
  }
}
