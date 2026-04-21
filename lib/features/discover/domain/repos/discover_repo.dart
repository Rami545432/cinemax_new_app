import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class DiscoverRepo {
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  );
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  );
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesItemsByKeyword(
    int page,
    int keyword,
  );
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesItemsByKeyword(
    int page,
    int keyword,
  );
}
