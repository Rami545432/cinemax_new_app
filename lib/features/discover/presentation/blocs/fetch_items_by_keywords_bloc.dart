import 'package:dartz/dartz.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/api/config/pagintaion_config.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:movify/features/discover/presentation/core/enums/type_enum.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class FetchItemsByKeywordsBloc
    extends CategoryPaginationBloc<TypeEnum, CardDisplayModel, NoParams> {
  final FetchMoviesByKeywordsUseCase fetchMoviesByKeywordsUseCase;
  final FetchSeriesByKeywordsUseCase fetchSeriesByKeywordsUseCase;
  final int keywordId;
  FetchItemsByKeywordsBloc({
    required this.fetchMoviesByKeywordsUseCase,
    required this.fetchSeriesByKeywordsUseCase,
    required this.keywordId,
  }) : super(PaginationConfig());

  @override
  List<TypeEnum> get allCategories => TypeEnum.values;

  @override
  Future<Either<Failure, PageResult<CardDisplayModel>>> fetchCategoryData(
    TypeEnum category,
    int page,
    NoParams? params,
  ) async => switch (category) {
    TypeEnum.movie => (await fetchMoviesByKeywordsUseCase.call(
      page,
      keywordId,
    )).map((pageResult) => pageResult.map((movie) => movie.toCardDisplay())),
    TypeEnum.tv => (await fetchSeriesByKeywordsUseCase.call(
      page,
      keywordId,
    )).map((pageResult) => pageResult.map((series) => series.toCardDisplay())),
  };
}
