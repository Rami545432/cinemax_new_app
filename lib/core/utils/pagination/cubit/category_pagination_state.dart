import 'package:cinemax_app_new/core/utils/pagination/config/pagination_info.dart';
import 'package:equatable/equatable.dart';

/// C = Category enum type
/// T = Item/Entity type
abstract class CategoryPaginationState<C, T> extends Equatable {
  const CategoryPaginationState();
  @override
  List<Object?> get props => [];
}

class CategoryPaginationInitial<C, T> extends CategoryPaginationState<C, T> {}

class CategoryPaginationLoading<C, T> extends CategoryPaginationState<C, T> {}

class CategoryPaginationLoaded<C, T> extends CategoryPaginationState<C, T> {
  final Map<C, PaginationInfo<T>> categoriesData;

  const CategoryPaginationLoaded({required this.categoriesData});
  @override
  List<Object?> get props => [categoriesData];
  PaginationInfo<T> getPaginationInfo(C category) {
    return categoriesData[category] ?? PaginationInfo<T>();
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

  bool isInitialLoad(C category) {
    return getPaginationInfo(category).isInitialLoad;
  }

  bool hasData(C category) {
    return getPaginationInfo(category).hasData;
  }

  String? getError(C category) {
    return getPaginationInfo(category).error;
  }

  CategoryPaginationLoaded<C, T> copyWithCategory({
    required C category,
    required PaginationInfo<T> paginationInfo,
  }) {
    final newData = Map<C, PaginationInfo<T>>.from(categoriesData);
    newData[category] = paginationInfo;
    return CategoryPaginationLoaded(categoriesData: newData);
  }
}
