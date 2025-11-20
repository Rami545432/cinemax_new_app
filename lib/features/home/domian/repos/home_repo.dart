import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:dio/dio.dart';

abstract class HomeRepo {
  MovieListResult fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    String? region,
    CancelToken? cancelToken,
  });
  MovieListResult fetchUpcomingMovies({int page = 1, CancelToken? cancelToken});
  MovieListResult fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
    String? region,
  });
  MovieListResult fetchTopRatedMovies({int page = 1, CancelToken? cancelToken});
  MovieListResult fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
}
