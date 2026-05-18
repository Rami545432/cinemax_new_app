import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/features/details/domain/enums/recomended_category.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_movies_recommendations_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_series_recommendations_use_case.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

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
