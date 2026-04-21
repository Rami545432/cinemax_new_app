// fetch_genre_bloc.dart
import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/api/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_bloc.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:dartz/dartz.dart';

class FetchGenreBloc
    extends
        CategoryPaginationBloc<
          GenreCategory,
          CardDisplayModel,
          GenreFilterParams
        > {
  final FetchMoviesByGenreUseCase fetchMoviesByGenreUseCase;
  final FetchSeriesByGenreUseCase fetchSeriesByGenreUseCase;
  final int genreId;

  FetchGenreBloc({
    required this.fetchMoviesByGenreUseCase,
    required this.fetchSeriesByGenreUseCase,
    required this.genreId,
  }) : super(PaginationConfig());

  @override
  List<GenreCategory> get allCategories => GenreCategory.values;

  @override
  Future<Either<Failure, PageResult<CardDisplayModel>>> fetchCategoryData(
    GenreCategory category,
    int page, // ← owned by base bloc
    GenreFilterParams? params,
  ) async {
    // ✅ Safe default — genreId must exist so this is guaranteed
    // by the time screen fires LoadCategoryEvent with params
    final safeParams = params ?? GenreFilterParams(genreId: genreId);

    return switch (category) {
      GenreCategory.movies => (await fetchMoviesByGenreUseCase.call(
        genreId,
        page,
        safeParams,
      )).map((pageResult) => pageResult.map((movie) => movie.toCardDisplay())),
      GenreCategory.tv =>
        (await fetchSeriesByGenreUseCase.call(genreId, page, safeParams)).map(
          (pageResult) => pageResult.map((series) => series.toCardDisplay()),
        ),
    };
  }
}
