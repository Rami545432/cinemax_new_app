import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_state.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';

abstract class CategoryPaginationBloc<CAT, T, P>
    extends
        Bloc<
          CategoryPaginationEvent<CAT, P>,
          CategoryPaginationState<CAT, T, P>
        > {
  final PaginationConfig config;

  CategoryPaginationBloc(this.config)
    : super(const CategoryPaginationInitial()) {
    // concurrent — we made our own manual check inside _onLoadCategory
    // to prevent duplicate fetches. We must allow concurrent fetches for different categories!
    on<LoadCategoryEvent<CAT, P>>(_onLoadCategory, transformer: concurrent());

    // droppable — scroll events pile up fast,
    // ignore all new ones while one fetch is in-flight
    on<LoadNextPageEvent<CAT, P>>(_onLoadNextPage, transformer: droppable());

    // restartable — changing params twice quickly
    // cancels the first reload automatically
    on<UpdateParamsEvent<CAT, P>>(_onUpdateParams, transformer: restartable());

    // droppable — tapping refresh button twice
    // won't trigger two parallel full reloads
    on<LoadAllCategoriesEvent<CAT, P>>(
      _onLoadAllCategories,
      transformer: droppable(),
    );
  }

  // ── Abstract contract ─────────────────────────────────────────────
  Future<Either<Failure, PageResult<T>>> fetchCategoryData(
    CAT category,
    int page,
    P? params,
  );

  List<CAT> get allCategories;

  // ── Private helpers ───────────────────────────────────────────────

  /// Emits the initial loaded map if not already loaded
  void _ensureInitialized(Emitter<CategoryPaginationState<CAT, T, P>> emit) {
    if (state is! CategoryPaginationLoaded<CAT, T, P>) {
      emit(
        CategoryPaginationLoaded(
          categoriesData: {
            for (final cat in allCategories) cat: PaginationInfo<T, P>(),
          },
        ),
      );
    }
  }

  /// Always reads the latest loaded state — safe after every await
  CategoryPaginationLoaded<CAT, T, P> get _loaded =>
      state as CategoryPaginationLoaded<CAT, T, P>;

  // ── Handlers ──────────────────────────────────────────────────────

  Future<void> _onLoadCategory(
    LoadCategoryEvent<CAT, P> event,
    Emitter<CategoryPaginationState<CAT, T, P>> emit,
  ) async {
    _ensureInitialized(emit);

    final currentInfo = _loaded.getPaginationInfo(event.category);

    // If we're not forcing a refresh, and we already have items or are currently fetching, ignore the event.
    if (!event.forceRefresh &&
        (currentInfo.items.isNotEmpty || currentInfo.isFetchingFirstPage)) {
      return;
    }

    // On forceRefresh wipe items but keep params
    // On normal load keep everything as is
    final infoToUse = event.forceRefresh
        ? PaginationInfo<T, P>(params: currentInfo.params)
        : currentInfo;

    emit(
      _loaded.copyWithCategory(
        category: event.category,
        paginationInfo: infoToUse.copyWith(
          isFetchingFirstPage: true,
          firstPageError: null,
          fetchMoreError: null,
        ),
      ),
    );

    final result = await fetchCategoryData(event.category, 1, infoToUse.params);

    // _loaded re-read here — safe because Emitter
    // is scoped to this handler, no other handler
    // can emit between our lines in the same event
    result.fold(
      (failure) => emit(
        _loaded.copyWithCategory(
          category: event.category,
          paginationInfo: infoToUse.copyWith(
            isFetchingFirstPage: false,
            firstPageError: failure.errorMessage,
          ),
        ),
      ),
      (page) => emit(
        _loaded.copyWithCategory(
          category: event.category,
          paginationInfo: infoToUse.copyWith(
            items: page.results,
            isFetchingFirstPage: false,
            currentPage: 1,
            totalPages: page.totalPages,
            totalResults: page.totalResults,
          ),
        ),
      ),
    );
  }

  Future<void> _onLoadNextPage(
    LoadNextPageEvent<CAT, P> event,
    Emitter<CategoryPaginationState<CAT, T, P>> emit,
  ) async {
    if (state is! CategoryPaginationLoaded<CAT, T, P>) {
      return;
    }

    final currentInfo = _loaded.getPaginationInfo(event.category);

    // canLoadMore already checks isFetchingFirstPage + isFetchingMore
    // droppable() handles scroll spam — double safety here
    if (!currentInfo.canLoadMore) {
      return;
    }

    final nextPage = currentInfo.currentPage + 1;

    emit(
      _loaded.copyWithCategory(
        category: event.category,
        paginationInfo: currentInfo.copyWith(
          isFetchingMore: true,
          fetchMoreError: null,
        ),
      ),
    );

    final result = await fetchCategoryData(
      event.category,
      nextPage,
      currentInfo.params,
    );

    // Read fresh info after await — items may have changed
    // if another event touched this category
    final latestInfo = _loaded.getPaginationInfo(event.category);

    result.fold(
      (failure) => emit(
        _loaded.copyWithCategory(
          category: event.category,
          paginationInfo: latestInfo.copyWith(
            isFetchingMore: false,
            fetchMoreError: failure.errorMessage,
          ),
        ),
      ),
      (page) => emit(
        _loaded.copyWithCategory(
          category: event.category,
          paginationInfo: latestInfo.copyWith(
            items: [...latestInfo.items, ...page.results],
            isFetchingMore: false,
            currentPage: nextPage,
            totalPages: page.totalPages,
            totalResults: page.totalResults,
          ),
        ),
      ),
    );
  }

  Future<void> _onUpdateParams(
    UpdateParamsEvent<CAT, P> event,
    Emitter<CategoryPaginationState<CAT, T, P>> emit,
  ) async {
    if (state is! CategoryPaginationLoaded<CAT, T, P>) {
      return;
    }

    // Wipe category state, store new params, reload from page 1
    emit(
      _loaded.copyWithCategory(
        category: event.category,
        paginationInfo: PaginationInfo<T, P>(params: event.params),
      ),
    );

    // Delegate directly to load handler — no duplication
    // We pass forceRefresh: true so that it ignores the check we added above
    await _onLoadCategory(
      LoadCategoryEvent(event.category, forceRefresh: true),
      emit,
    );
  }

  Future<void> _onLoadAllCategories(
    LoadAllCategoriesEvent<CAT, P> event,
    Emitter<CategoryPaginationState<CAT, T, P>> emit,
  ) async {
    // Show loading only if completely fresh
    if (state is! CategoryPaginationLoaded<CAT, T, P>) {
      emit(const CategoryPaginationLoading());
    }

    _ensureInitialized(emit);

    // All categories fire in parallel
    await Future.wait(
      allCategories.map(
        (cat) =>
            _onLoadCategory(LoadCategoryEvent(cat, forceRefresh: true), emit),
      ),
    );
  }
}
