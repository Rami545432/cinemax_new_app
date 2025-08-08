import 'package:cinemax_app_new/core/utils/services/api_service.dart';
import 'package:cinemax_app_new/features/home/domian/entites/entity.dart';
import 'package:cinemax_app_new/features/search/data/models/search_actor_model/search_actor_model.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:dio/dio.dart';

import '../../../../models/movie_model.dart';
import '../../../series/data/models/series_model.dart';
import '../../../series/domain/entites/series_entity.dart';

abstract class RemoteSearchDataSource {
  Future<List<MovieEntity>> searchMovies(
    String query,
    CancelToken? cancelToken,
  );

  Future<List<SearchActorEntity>> searchActors(
    String query,
    CancelToken? cancelToken,
  );
  Future<List<SeriesEntity>> searchTvShows(
    String query,
    CancelToken? cancelToken,
  );
}

class RemoteSearchDataSourceImpl extends RemoteSearchDataSource {
  final ApiService apiService;

  RemoteSearchDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> searchMovies(
    String query,
    CancelToken? cancelToken,
  ) async {
    List<MovieEntity> suggestions = [];
    var data = await apiService.searchRequest(
      query: query,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['poster_path'] != null) {
        suggestions.add(MovieModel.fromJson(movie));
      }
    }
    return suggestions;
  }

  @override
  Future<List<SearchActorEntity>> searchActors(
    String query,
    CancelToken? cancelToken,
  ) async {
    List<SearchActorEntity> movies = [];
    var data = await apiService.searchActor(
      query: query,
      cancelToken: cancelToken,
    );
    for (var movie in data['results']) {
      if (movie['profile_path'] != null) {
        movies.add(SearchActorModel.fromJson(movie));
      }
    }
    return movies;
  }

  @override
  Future<List<SeriesEntity>> searchTvShows(
    String query,
    CancelToken? cancelToken,
  ) async {
    List<SeriesEntity> suggestions = [];
    var data = await apiService.searchRequest(
      type: 'tv',
      query: query,
      cancelToken: cancelToken,
    );
    for (var suggestion in data["results"]) {
      if (suggestion['poster_path'] != null) {
        suggestions.add(SeriesModel.fromJson(suggestion));
      }
    }
    return suggestions;
  }
}
