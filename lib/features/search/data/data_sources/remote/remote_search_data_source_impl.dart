import 'package:dio/dio.dart';
import 'package:movify/core/network/api/services/api_service.dart';
import 'package:movify/features/home/data/models/movie_model.dart';
import 'package:movify/features/home/data/models/series_model.dart';
import 'package:movify/features/search/data/data_sources/remote/remote_search_data_source.dart';
import 'package:movify/features/search/data/models/search_actor_model/search_actor_model.dart';

class RemoteSearchDataSourceImpl implements RemoteSearchDataSource {
  final ApiService apiService;
  final Map<String, CancelToken> _tokens = {};
  CancelToken _refreshToken(String key) {
    _tokens[key]?.cancel(); // cancel the previous one
    final token = CancelToken();
    _tokens[key] = token;
    return token;
  }

  void dispose() {
    for (final t in _tokens.values) {
      t.cancel();
    }
    _tokens.clear();
  }

  RemoteSearchDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final data = await apiService.tmdb.search.searchMovies(
      query,
      cancelToken: _refreshToken('searchMovies'),
    );
    final suggestions = (data['results'] as List)
        .where((e) => e['poster_path'] != null)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return suggestions;
  }

  @override
  Future<List<SearchActorModel>> searchActors(String query) async {
    final data = await apiService.tmdb.search.searchActors(
      query,
      cancelToken: _refreshToken('searchActors'),
    );
    final actors = (data['results'] as List)
        .where((element) => element['profile_path'] != null)
        .map(
          (element) =>
              SearchActorModel.fromJson(element as Map<String, dynamic>),
        )
        .toList();

    return actors;
  }

  @override
  Future<List<SeriesModel>> searchSeries(String query) async {
    final data = await apiService.tmdb.search.searchSeries(
      query,
      cancelToken: _refreshToken('searchSeries'),
    );
    final suggestions = (data['results'] as List)
        .where((e) => e['poster_path'] != null)
        .map((e) => SeriesModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return suggestions;
  }
}
