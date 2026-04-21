import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_movies_recommendations_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_series_recommendations_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:dartz/dartz.dart';

class RecomendedBloc
    extends
        CategoryPaginationBloc<RecomendedCategory, CardDisplayModel, NoParams> {
  RecomendedBloc(
    this.fetchMoviesRecommendationsUseCase,
    this.fetchSeriesRecommendationsUseCase,
    this.contentId,
  ) : super(PaginationConfig());
  final FetchMoviesRecommendationsUseCase fetchMoviesRecommendationsUseCase;
  final FetchSeriesRecommendationsUseCase fetchSeriesRecommendationsUseCase;
  final int contentId;

  @override
  Future<Either<Failure, PageResult<CardDisplayModel>>> fetchCategoryData(
    RecomendedCategory category,
    int page,
    NoParams? params,
  ) async => switch (category) {
    RecomendedCategory.movie => (await fetchMoviesRecommendationsUseCase.call(
      contentId,
      page,
    )).map((e) => e.map((e) => e.toCardDisplay())),
    RecomendedCategory.tv => (await fetchSeriesRecommendationsUseCase.call(
      contentId,
      page,
    )).map((e) => e.map((e) => e.toCardDisplay())),
  };
  @override
  List<RecomendedCategory> get allCategories => RecomendedCategory.values;
}
