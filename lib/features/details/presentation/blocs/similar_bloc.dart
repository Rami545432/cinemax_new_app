import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_similar_movies_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_similar_series_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:dartz/dartz.dart';

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
