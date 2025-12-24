import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/types/data_source_types.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details_model.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';
import 'package:dio/dio.dart';

abstract class RemoteHomeDataSource {
  RemoteDataSourceListMovieEntity fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
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
  RemoteDataSourceListSeriesEntity fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });

  Future<SeriesSeasonDetailsEntitiy> fetchTvShowSeasonDetails({
    required int tvid,
    required int season,
    CancelToken? cancelToken,
  });
  RemoteDataSourceListSeriesEntity fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
}

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
  final ApiService apiService;
  Map<String, dynamic> jsondecode = {};

  RemoteHomeDataSourceImpl({required this.apiService});
  @override
  RemoteDataSourceListMovieEntity fetchPopularMovies(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    var data = await apiService.tmdb.content.getPopular(
      type: 'movie',
      genreId: generId,
      page: page,
      cancelToken: cancelToken,
    );
    List<MovieEntity> movies = [];
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    return PagedResult<MovieEntity>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: movies,
    );
  }

  @override
  RemoteDataSourceListMovieEntity fetchUpcomingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.tmdb.content.getUpcomingMovies(
      // type: 'movie',
      page: page,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }

    return PagedResult<MovieEntity>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: movies,
    );
  }

  @override
  RemoteDataSourceListMovieEntity fetchNowPlayingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.tmdb.content.getNowPlayingMovies(
      // type: 'movie',
      page: page,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    return PagedResult<MovieEntity>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: movies,
    );
  }

  @override
  RemoteDataSourceListMovieEntity fetchTopRatedMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.tmdb.content.getTopRated(
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
    return PagedResult<MovieEntity>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: movies,
    );
  }

  @override
  RemoteDataSourceListMovieEntity fetchTrendingMovies({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<MovieModel> movies = [];
    var data = await apiService.tmdb.content.getTrending(
      type: 'movie',
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    return PagedResult<MovieEntity>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: movies,
    );
  }

  @override
  RemoteDataSourceListSeriesEntity fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];

    var data = await apiService.tmdb.content.getPopular(
      genreId: generId,
      type: 'tv',
      page: page,
      cancelToken: cancelToken,
    );
    for (var show in data['results']) {
      if (show['poster_path'] != null) {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return PagedResult<SeriesModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: tvShows,
    );
  }

  @override
  RemoteDataSourceListSeriesEntity fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];
    var data = await apiService.tmdb.content.getTopRated(
      type: 'tv',
      page: page,
      cancelToken: cancelToken,
    );
    for (var show in data['results']) {
      if (show['poster_path'] != null) {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return PagedResult<SeriesModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: tvShows,
    );
  }

  @override
  RemoteDataSourceListSeriesEntity fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> tvShows = [];
    var data = await apiService.tmdb.content.getTrending(
      type: 'tv',
      cancelToken: cancelToken,
    );
    for (var show in data['results']) {
      if (show['poster_path'] != null) {
        tvShows.add(SeriesModel.fromJson(show));
      }
    }
    return PagedResult<SeriesModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: tvShows,
    );
  }

  @override
  Future<SeriesSeasonDetailsEntitiy> fetchTvShowSeasonDetails({
    required int tvid,
    required int season,
    CancelToken? cancelToken,
  }) async {
    var data = await apiService.tmdb.details.getSeasonDetails(
      tvid: tvid,
      season: season,
      cancelToken: cancelToken,
    );

    return SeriesSeasonDetailsModel.fromJson(data);
  }

  @override
  RemoteDataSourceListSeriesEntity fetchAiringTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    List<SeriesModel> series = [];
    var data = await apiService.tmdb.content.getAiringTodayTv(
      page: page,
      cancelToken: cancelToken,
    );

    for (var element in data['results']) {
      if (element['poster_path'] != null) {
        series.add(SeriesModel.fromJson(element));
      }
    }
    return PagedResult<SeriesModel>(
      page: data['page'],
      totalPages: data['total_pages'],
      totalResults: data['total_results'],
      results: series,
    );
  }
}
