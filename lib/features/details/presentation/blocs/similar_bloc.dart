import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/features/details/domain/enums/similar_category.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_similar_movies_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_similar_series_use_case.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class SimilarBloc
    extends
        CategoryPaginationBloc<SimilarCategory, CardDisplayModel, NoParams> {
  SimilarBloc(
    this.fetchMovieSimilarUseCase,
    this.fetchSeriesSimilarUseCase,
    this.contentId,
  ) : super(PaginationConfig());
  final FetchSimilarMoviesUseCase fetchMovieSimilarUseCase;
  final FetchSimilarSeriesUseCase fetchSeriesSimilarUseCase;
  final int contentId;

  @override
  Future<Either<Failure, PageResult<CardDisplayModel>>> fetchCategoryData(
    SimilarCategory category,
    int page,
    NoParams? params,
  ) async => switch (category) {
    SimilarCategory.movie => (await fetchMovieSimilarUseCase.call(
      contentId,
      page,
    )).map((e) => e.map((e) => e.toCardDisplay())),
    SimilarCategory.tv => (await fetchSeriesSimilarUseCase.call(
      contentId,
      page,
    )).map((e) => e.map((e) => e.toCardDisplay())),
  };
  @override
  List<SimilarCategory> get allCategories => SimilarCategory.values;
}
