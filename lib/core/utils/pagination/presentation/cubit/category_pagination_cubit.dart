import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/cubit/category_pagination_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CAT = Category enum type
/// T = Item/Entity type
/// P = Parameters type (filters, sorting, anything)

abstract class CategoryPaginationCubit<CAT, T, P>
    extends Cubit<CategoryPaginationState<CAT, T, P>> {
  final PaginationConfig config;


  CategoryPaginationCubit(this.config)
    : super(CategoryPaginationInitial<CAT, T, P>());

  /// Fetch method must now receive params
  Future<Either<Failure, PageResult<T>>> fetchCategoryData(
    CAT category,
    int page,
    P? params,
  );

  List<CAT> get allCategories;

  void initialize() {
    final initialData = <CAT, PaginationInfo<T, P>>{};

    for (final category in allCategories) {
      initialData[category] = PaginationInfo<T, P>();
    }

    safeEmit(CategoryPaginationLoaded<CAT, T, P>(categoriesData: initialData));
  }

  /// Initial or refreshed load for a category
  Future<void> loadCategory(CAT category) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) {
      initialize();
      return loadCategory(category);
    }

    final currentInfo = currentState.getPaginationInfo(category);

    if (currentInfo.isFetching) {
      return;
    }

    safeEmit(
      currentState.copyWithCategory(
        category: category,
        paginationInfo: currentInfo.copyWith(isFetching: true, error: null),
      ),
    );

    try {
      final result = await fetchCategoryData(
        category,
        1,
        currentInfo.params,
      );

      result.fold(
        (failure) {
          final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;
          safeEmit(
            updatedState.copyWithCategory(
              category: category,
              paginationInfo: currentInfo.copyWith(
                error: failure.errorMessage,
                isFetching: false,
              ),
            ),
          );
        },
        (newItems) {
          final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;

          safeEmit(
            updatedState.copyWithCategory(
              category: category,
              paginationInfo: currentInfo.copyWith(
                items: newItems.results,
                isFetching: false,
                currentPage: 1,
                totalPages: newItems.totalPages,
                totalResults: newItems.totalResults,
              ),
            ),
          );
        },
      );
    } catch (e) {
      final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;
      safeEmit(
        updatedState.copyWithCategory(
          category: category,
          paginationInfo: currentInfo.copyWith(
              error: e.toString(),
              isFetching: false,
            ),
          ),
        );
    }
  }

  Future<void> loadNextPage(CAT category) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) {
      return;
    }

    final currentInfo = currentState.getPaginationInfo(category);
    if (!currentInfo.canLoadMore) {
      return;
    }

    final nextPage = currentInfo.currentPage + 1;

    safeEmit(
      currentState.copyWithCategory(
        category: category,
        paginationInfo: currentInfo.copyWith(isFetching: true, error: null),
      ),
    );

    try {
      final result = await fetchCategoryData(
        category,
        nextPage,
        currentInfo.params,
      );

      result.fold(
        (failure) {
          final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;
          safeEmit(
            updatedState.copyWithCategory(
              category: category,
              paginationInfo: currentInfo.copyWith(
                error: failure.errorMessage,
                isFetching: false,
              ),
            ),
          );
        },
        (newItems) {
          final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;

          safeEmit(
            updatedState.copyWithCategory(
              category: category,
              paginationInfo: currentInfo.copyWith(
                items: [...currentInfo.items, ...newItems.results],
                isFetching: false,
                currentPage: nextPage,
                totalPages: newItems.totalPages,
                totalResults: newItems.totalResults,
              ),
            ),
          );
        },
      );
    } catch (e) {
      final updatedState = state as CategoryPaginationLoaded<CAT, T, P>;
      safeEmit(
        updatedState.copyWithCategory(
          category: category,
          paginationInfo: currentInfo.copyWith(
            error: e.toString(),
            isFetching: false,
          ),
        ),
      );
    }
  }

  /// The key addition:
  /// Update filters/params and reload category
  Future<void> updateCategoryParams(CAT category, P params) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) {
      return;
    }

    final currentInfo = currentState.getPaginationInfo(category);

    safeEmit(
      currentState.copyWithCategory(
        category: category,
        paginationInfo: currentInfo.copyWith(
          params: params,
          items: currentInfo.items,
          currentPage: currentInfo.currentPage,
          totalPages: currentInfo.totalPages,
          totalResults: currentInfo.totalResults,
        ),
      ),
    );

    await loadCategory(category);
  }

  Future<void> refreshCategory(CAT category) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) {
      return;
    }

    safeEmit(
      currentState.copyWithCategory(
        category: category,
        paginationInfo: PaginationInfo<T, P>(
          params: currentState.getPaginationInfo(category).params,
        ),
      ),
    );

    await loadCategory(category);
  }

  Future<void> loadAllCategories() async {
    safeEmit(CategoryPaginationLoading<CAT, T, P>());
    initialize();
    await Future.wait(allCategories.map(loadCategory));
  }

  Future<void> refreshAllCategories() async {
    await loadAllCategories();
  }

}
