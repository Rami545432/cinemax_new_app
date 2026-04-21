import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/core/enums/type_enum.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
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
