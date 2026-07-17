import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

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
