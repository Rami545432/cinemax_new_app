import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/core/enums/type_enum.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:dartz/dartz.dart';

class FetchItemsByKeywordsCubit
    extends
        CategoryPaginationCubit<
          TypeEnum,
          CardDisplayModel, // ✅ Unified display type — no ContentEntity needed
          FetchItemsByKeywordsParams
        > {
  FetchItemsByKeywordsCubit({
    required this.fetchMoviesByKeywordsUseCase,
    required this.fetchSeriesByKeywordsUseCase,
  }) : super(PaginationConfig());

  final FetchMoviesByKeywordsUseCase fetchMoviesByKeywordsUseCase;
  final FetchSeriesByKeywordsUseCase fetchSeriesByKeywordsUseCase;
  final Map<TypeEnum, FetchItemsByKeywordsParams> _paramsByCategory = {};

  @override
  Future<Either<Failure, PageResult<CardDisplayModel>>> fetchCategoryData(
    TypeEnum category,
    int page,
    FetchItemsByKeywordsParams? params,
  ) async {
    final p =
        _paramsByCategory[category] ?? FetchItemsByKeywordsParams(keyword: 0);

    // ✅ Mapping happens HERE at the presentation boundary
    return switch (category) {
      TypeEnum.movie => (await fetchMoviesByKeywordsUseCase.call(
        page,
        p.keyword,
      )).map((pageResult) => pageResult.map((movie) => movie.toCardDisplay())),
      TypeEnum.tv =>
        (await fetchSeriesByKeywordsUseCase.call(page, p.keyword)).map(
          (pageResult) => pageResult.map((series) => series.toCardDisplay()),
        ),
    };
  }

  Future<void> loadItemsByKeyword({
    required TypeEnum category,
    required int keyword,
  }) async {
    _paramsByCategory[category] = FetchItemsByKeywordsParams(keyword: keyword);
    await loadCategory(category);
  }

  Future<void> updateContentId({
    required TypeEnum category,
    required int keyword,
  }) async {
    _paramsByCategory[category] = FetchItemsByKeywordsParams(keyword: keyword);
    await refreshCategory(category);
  }

  @override
  List<TypeEnum> get allCategories => TypeEnum.values;
}
