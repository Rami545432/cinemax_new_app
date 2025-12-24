import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:dio/dio.dart';

abstract class DiscoverRepo {
  MovieListResult fetchMoviesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  );
  SeriesListResult fetchSeriesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  );
}
