import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_state.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CAT = Category enum type
/// T = Item/Entity type
/// P = Parameters type (filters, sorting, anything)

abstract class CategoryPaginationCubit<CAT, T, P>
    extends Cubit<CategoryPaginationState<CAT, T, P>> {
  final PaginationConfig config;

  final Map<CAT, CancelToken> _cancelTokens = {};

  CategoryPaginationCubit(this.config)
    : super(CategoryPaginationInitial<CAT, T, P>());

  /// Fetch method must now receive params
  Future<Either<Failure, PagedResult<T>>> fetchCategoryData(
    CAT category,
    int page,
    P? params,
    CancelToken? cancelToken,
  );

  List<CAT> get allCategories;

  void initialize() {
    final initialData = <CAT, PaginationInfo<T, P>>{};

    for (var category in allCategories) {
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

    if (currentInfo.isFetching) return;

    _cancelTokens[category]?.cancel();
    _cancelTokens[category] = CancelToken();

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
        _cancelTokens[category],
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
      if (e is! DioException || !CancelToken.isCancel(e)) {
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
  }

  Future<void> loadNextPage(CAT category) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) return;

    final currentInfo = currentState.getPaginationInfo(category);
    if (!currentInfo.canLoadMore) return;

    final nextPage = currentInfo.currentPage + 1;

    _cancelTokens[category]?.cancel();
    _cancelTokens[category] = CancelToken();

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
        _cancelTokens[category],
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
      if (e is! DioException || !CancelToken.isCancel(e)) {
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
  }

  /// The key addition:
  /// Update filters/params and reload category
  Future<void> updateCategoryParams(CAT category, P params) async {
    final currentState = state;

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) return;

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

    if (currentState is! CategoryPaginationLoaded<CAT, T, P>) return;

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

  @override
  Future<void> close() {
    for (var token in _cancelTokens.values) {
      token.cancel();
    }
    return super.close();
  }

  void enterCategory(CAT category) {
    final currentState = state;

    if (currentState is CategoryPaginationLoaded<CAT, T, P>) {
      final currentInfo = currentState.getPaginationInfo(category);

      if (currentInfo.items.isNotEmpty) {
        refreshCategory(category);
        return;
      }

      emit(
        currentState.copyWithCategory(
          category: category,
          paginationInfo: PaginationInfo<T, P>(
            items: [],
            currentPage: 1,
            isFetching: true,
          ),
        ),
      );
    }

    loadCategory(category);
  }
}
