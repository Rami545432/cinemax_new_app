import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_similar_use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchSimilarCubit
    extends
        CategoryPaginationCubit<SimilarCategory, BaseCardModel, SimilarParams> {
  FetchSimilarCubit(this.fetchSimilarUseCase)
    : super(PaginationConfig(itemsPerPage: 20));
  final FetchSimilarUseCase fetchSimilarUseCase;
  final Map<SimilarCategory, SimilarParams> _paramsByCategory = {};

  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> fetchCategoryData(
    SimilarCategory category,
    int page,
    SimilarParams? params,
    CancelToken? cancelToken,
  ) async {
    final params = _paramsByCategory[category] ?? SimilarParams(id: 0);
    return await fetchSimilarUseCase.call(params, page, cancelToken, category);
  }

  Future<void> loadSimilarContent({
    required SimilarCategory category,
    required int contentId,
  }) async {
    // Store parameters for this category
    _paramsByCategory[category] = SimilarParams(id: contentId);

    await loadCategory(category);
  }

  /// Update parameters and reload
  Future<void> updateContentId({
    required SimilarCategory category,
    required int contentId,
  }) async {
    _paramsByCategory[category] = SimilarParams(id: contentId);

    await refreshCategory(category);
  }

  @override
  List<SimilarCategory> get allCategories => SimilarCategory.values;
}
