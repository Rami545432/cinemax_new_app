import 'package:equatable/equatable.dart';
import 'package:movify/core/pagination/api/config/pagination_info.dart';

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
  PaginationInfo<T, P> getPaginationInfo(C category) =>
      categoriesData[category] ?? PaginationInfo<T, P>();

  List<T> getItems(C category) => getPaginationInfo(category).items;

  bool isLoading(C category) => getPaginationInfo(category).isFetching;

  bool canLoadMore(C category) => getPaginationInfo(category).canLoadMore;

  int getTotalPages(C category) => getPaginationInfo(category).totalPages ?? 0;

  int getTotalResults(C category) =>
      getPaginationInfo(category).totalResults ?? 0;

  bool isInitialLoad(C category) => getPaginationInfo(category).isInitialLoad;

  bool hasData(C category) => getPaginationInfo(category).hasData;

  String? getError(C category) => getPaginationInfo(category).error;

  CategoryPaginationLoaded<C, T, P> copyWithCategory({
    required C category,
    required PaginationInfo<T, P> paginationInfo,
  }) {
    final newData = Map<C, PaginationInfo<T, P>>.from(categoriesData);
    newData[category] = paginationInfo;
    return CategoryPaginationLoaded(categoriesData: newData);
  }
}
