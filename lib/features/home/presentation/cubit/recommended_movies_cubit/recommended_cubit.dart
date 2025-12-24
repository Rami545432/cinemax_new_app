import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../details/domain/use_cases/fetch_recommended_use_case.dart';

class FetchRecommendedCubit
    extends
        CategoryPaginationCubit<
          RecomendedCategory,
          BaseCardModel,
          RecomendedParams
        > {
  FetchRecommendedCubit(this.fetchRecommendedUseCase)
    : super(PaginationConfig(itemsPerPage: 20));
  final FetchRecommendedUseCase fetchRecommendedUseCase;
  final Map<RecomendedCategory, RecomendedParams> _paramsByCategory = {};
  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> fetchCategoryData(
    RecomendedCategory category,
    int page,
    RecomendedParams? params,
    CancelToken? cancelToken,
  ) async {
    final params = _paramsByCategory[category] ?? RecomendedParams(id: 0);
    return await fetchRecommendedUseCase.call(
      params,
      page,
      cancelToken,
      category,
    );
  }

  Future<void> loadSimilarContent({
    required RecomendedCategory category,
    required int contentId,
  }) async {
    // Store parameters for this category
    _paramsByCategory[category] = RecomendedParams(id: contentId);

    await loadCategory(category);
  }

  /// Update parameters and reload
  Future<void> updateContentId({
    required RecomendedCategory category,
    required int contentId,
  }) async {
    _paramsByCategory[category] = RecomendedParams(id: contentId);

    await refreshCategory(category);
  }

  @override
  List<RecomendedCategory> get allCategories => RecomendedCategory.values;
}
