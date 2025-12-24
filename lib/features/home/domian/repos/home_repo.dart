import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:dio/dio.dart';

abstract class HomeRepo {
  MovieListResult fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  MovieListResult fetchUpcomingMovies({int page = 1, CancelToken? cancelToken});
  MovieListResult fetchTrendingMovies({int page = 1, CancelToken? cancelToken});
  MovieListResult fetchTopRatedMovies({int page = 1, CancelToken? cancelToken});
  MovieListResult fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  SeriesListResult fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  SeriesListResult fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  SeriesListResult fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });

  SeriesListResult fetchTvAiringToday({int page = 1, CancelToken? cancelToken});
}
