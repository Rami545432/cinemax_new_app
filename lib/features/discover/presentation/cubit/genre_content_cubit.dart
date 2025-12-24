import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/use_case/fetch_genre_content_use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GenreContentCubit
    extends
        CategoryPaginationCubit<
          GenreCategory, // Category: Movies or TV
          BaseCardModel, // Items
          GenreFilterParams // Filters (includes genre )
        > {
  final FetchGenreContentUseCase fetchGenreUseCase;

  // Store filters per content type
  final Map<GenreCategory, GenreFilterParams> _filtersByType = {};

  GenreContentCubit({required this.fetchGenreUseCase})
    : super(PaginationConfig(itemsPerPage: 20));

  @override
  List<GenreCategory> get allCategories => GenreCategory.values;

  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> fetchCategoryData(
    GenreCategory category,
    int page,
    GenreFilterParams? params,
    CancelToken? cancelToken,
  ) async {
    final filters = _filtersByType[category];

    if (filters == null) {
      return Right(
        PagedResult<BaseCardModel>(
          page: 1,
          totalPages: 1,
          totalResults: 0,
          results: [],
        ),
      ); // No filters set yet
    }

    return fetchGenreUseCase.call(
      contentType: category,
      params: filters,
      page: page,
      cancelToken: cancelToken,
    );
  }

  /// Load genre for specific content type
  Future<void> loadGenre({
    required GenreCategory contentType,
    required GenreFilterParams params,
  }) async {
    _filtersByType[contentType] = GenreFilterParams(
      genreId: params.genreId,
      sortBy: params.sortBy,
      minYear: params.minYear,
      maxYear: params.maxYear,
      minRating: params.minRating,
      maxRating: params.maxRating,
      withKeywords: params.withKeywords,
      withoutKeywords: params.withoutKeywords,
      withNetworks: params.withNetworks,
      withCompanies: params.withCompanies,
      withProviders: params.withProviders,
      minRuntime: params.minRuntime,
      maxRuntime: params.maxRuntime,
      page: params.page,
    );

    await loadCategory(contentType);
  }

  /// Update filters for content type
  Future<void> updateFilters({
    required GenreCategory contentType,
    required GenreFilterParams filters,
  }) async {
    _filtersByType[contentType] = filters;
    await refreshCategory(contentType);
  }

  Future<void> updateSingleFilter<T>({
    required GenreCategory category,
    required GenreFilterParams Function(GenreFilterParams?) update,
  }) async {
    final current = _filtersByType[category];
    final updated = update(current ?? const GenreFilterParams());
    _filtersByType[category] = updated;
    await refreshCategory(category);
  }

  /// Get current filters
  GenreFilterParams? getFilters(GenreCategory contentType) {
    return _filtersByType[contentType];
  }
}
