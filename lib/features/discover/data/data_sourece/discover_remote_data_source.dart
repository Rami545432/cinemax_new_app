import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/types/data_source_types.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:dio/dio.dart';

abstract class DiscoverRemoteDataSource {
  RemoteDataSourceListMovieEntity fetchMoviesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  );
  RemoteDataSourceListSeriesEntity fetchSeriesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  );
}

class DiscoverRemoteDataSourceImpl extends DiscoverRemoteDataSource {
  final ApiService apiService;
  DiscoverRemoteDataSourceImpl({required this.apiService});
  @override
  RemoteDataSourceListMovieEntity fetchMoviesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  ) async {
    final List<MovieModel> movies = [];
    var data = await apiService.tmdb.content.getItemsByGenre(
      type: 'movie',
      params: params,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        movies.add(MovieModel.fromJson(movie));
      }
    }
    final totalPages = data['total_pages'];
    final totalResults = data['total_results'];
    final page = data['page'];

    return PagedResult<MovieModel>(
      page: page,
      totalPages: totalPages,
      totalResults: totalResults,
      results: movies,
    );
  }

  @override
  RemoteDataSourceListSeriesEntity fetchSeriesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  ) async {
    List<SeriesModel> series = [];
    var data = await apiService.tmdb.content.getItemsByGenre(
      type: 'tv',
      params: params,
      cancelToken: cancelToken,
    );
    for (var serie in data['results']) {
      if (serie['poster_path'] != null) {
        series.add(SeriesModel.fromJson(serie));
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
