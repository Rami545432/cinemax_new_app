import 'package:cinemax_app_new/core/network/api/services/safe_api_calls.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:dio/dio.dart';

import '../data_soureces/remote_home_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteHomeDataSource remoteHomeDataSource;

  HomeRepoImpl({required this.remoteHomeDataSource});
  @override
  MovieListResult fetchPopularMovies(
    dynamic generId, {
    int page = 1,

    CancelToken? cancelToken,
  }) {
    return safeApiCall(
      () => remoteHomeDataSource.fetchPopularMovies(
        generId,
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  MovieListResult fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return safeApiCall(
      () => remoteHomeDataSource.fetchUpcomingMovies(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  MovieListResult fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return safeApiCall(
      () => remoteHomeDataSource.fetchTopRatedMovies(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  MovieListResult fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
    String? region,
  }) {
    return safeApiCall(
      () => remoteHomeDataSource.fetchTrendingMovies(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  MovieListResult fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return safeApiCall(
      () => remoteHomeDataSource.fetchNowPlayingMovies(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  SeriesListResult fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    return safeApiCall(
      () => remoteHomeDataSource.fetchPopularTvShows(
        generId,
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  SeriesListResult fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    return safeApiCall(
      () => remoteHomeDataSource.fetchTopRatedTvShows(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  SeriesListResult fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    return safeApiCall(
      () => remoteHomeDataSource.fetchTrendingTvShows(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  SeriesListResult fetchTvAiringToday({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    return safeApiCall(
      () => remoteHomeDataSource.fetchAiringTvShows(
        page: page,
        cancelToken: cancelToken,
      ),
    );
  }
}
