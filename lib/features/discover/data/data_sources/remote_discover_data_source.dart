import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';

abstract interface class DiscoverRemoteDataSource {
  Future<PageResult<MovieModel>> fetchMoviesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  );
  Future<PageResult<SeriesModel>> fetchSeriesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  );
  Future<PageResult<MovieModel>> fetchMoviesItemsByKeyword(
    int page,
    int keyword,
  );
  Future<PageResult<SeriesModel>> fetchSeriesItemsByKeyword(
    int page,
    int keyword,
  );
}
