import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/types/data_source_types.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteHomeDataSource {
  RemoteDataSourceListMovieEntity fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
    String? region,
  });
  RemoteDataSourceListMovieEntity fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });

  RemoteDataSourceListMovieEntity fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListMovieEntity fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListMovieEntity fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final ApiService apiService;
  Map<String, dynamic> jsondecode = {};

  RemoteHomeDataSourceImpl({required this.apiService});
  @override
  RemoteDataSourceListMovieEntity fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
    String? region,
  }) async {
    List<MovieModel> movies = [];

    var data = await apiService.getPopular(
      type: 'movie',
      page: page,
      cancelToken: cancelToken,
      genreId: generId,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }

    return movies;
  }

  @override
  RemoteDataSourceListMovieEntity fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.getUpcoming(
      type: 'movie',
      page: page,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }

    return movies;
  }

  @override
  RemoteDataSourceListMovieEntity fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.getNowPlaying(
      type: 'movie',
      page: page,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    return movies;
  }

  @override
  RemoteDataSourceListMovieEntity fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.getTopRated(
      type: 'movie',
      page: page,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    jsondecode = data;
    return movies;
  }

  @override
  RemoteDataSourceListMovieEntity fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.getTrending(
      type: 'movie',
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    return movies;
  }
}
