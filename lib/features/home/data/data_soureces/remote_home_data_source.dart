import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/utils/services/api_service.dart';
import '../../../../models/base_card_model.dart';
import '../../../../models/movie_details_model/movie_details_model.dart';
import '../../../../models/movie_model.dart';
import '../../../series/data/models/series_model.dart';
import '../../domian/entites/entity.dart';

abstract class RemoteHomeDataSource {
  Future<List<MovieEntity>> fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<MovieEntity>> fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<MovieDetailsModel> fetchMovieDetails(
    int movieId,
    CancelToken? cancelToken,
  );
  Future<List<MovieEntity>> fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<MovieEntity>> fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<MovieEntity>> fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<List<BaseCardModel>> fetchRecommmendedItems(
    int id,
    String type,
    CancelToken? cancelToken,
  );
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final ApiService apiService;

  RemoteHomeDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieEntity> movies = [];
    log(page.toString());
    var data = await apiService.getPopular(
      genreId: generId,
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
  Future<List<MovieEntity>> fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieEntity> movies = [];
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
  Future<MovieDetailsModel> fetchMovieDetails(
    int movieId,
    CancelToken? cancelToken,
  ) async {
    var data = await apiService.getDetails(
      id: movieId,
      type: 'movie',
      cancelToken: cancelToken,
    );

    return MovieDetailsModel.fromJson(data);
  }

  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieEntity> movies = [];
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
  Future<List<MovieEntity>> fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieEntity> movies = [];
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
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieEntity> movies = [];
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

  @override
  Future<List<BaseCardModel>> fetchRecommmendedItems(
    int movieId,
    String type,
    CancelToken? cancelToken,
  ) async {
    List<BaseCardModel> movies = [];
    var data = await apiService.getRecommendations(
      movieId: movieId,
      type: type,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        type == 'movie'
            ? movies.add(MovieModel.fromJson(movie))
            : movies.add(SeriesModel.fromJson(movie));
      }
    }
    return movies;
  }
}
