import 'package:equatable/equatable.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';

sealed class CategoryPaginationState<CAT, T, P> extends Equatable {
  const CategoryPaginationState();

  @override
  List<Object?> get props => [];
}

/// Before initialize() is called
class CategoryPaginationInitial<CAT, T, P>
    extends CategoryPaginationState<CAT, T, P> {
  const CategoryPaginationInitial();
}

/// Only shown on very first loadAllCategories before map is built
class CategoryPaginationLoading<CAT, T, P>
    extends CategoryPaginationState<CAT, T, P> {
  const CategoryPaginationLoading();
}

/// The one and only ongoing state — carries the full map
class CategoryPaginationLoaded<CAT, T, P>
    extends CategoryPaginationState<CAT, T, P> {
  final Map<CAT, PaginationInfo<T, P>> categoriesData;

  const CategoryPaginationLoaded({required this.categoriesData});

  /// Safe read — never throws, returns empty info if category missing
  PaginationInfo<T, P> getPaginationInfo(CAT category) =>
      categoriesData[category] ?? PaginationInfo<T, P>();

  /// Immutable update for one category
  CategoryPaginationLoaded<CAT, T, P> copyWithCategory({
    required CAT category,
    required PaginationInfo<T, P> paginationInfo,
  }) => CategoryPaginationLoaded(
    categoriesData: {...categoriesData, category: paginationInfo},
  );

  @override
  List<Object?> get props => [categoriesData];
}

/// Only reached if initialize itself throws — should rarely happen
class CategoryPaginationError<CAT, T, P>
    extends CategoryPaginationState<CAT, T, P> {
  final String message;

  const CategoryPaginationError(this.message);

  @override
  List<Object?> get props => [message];
}
