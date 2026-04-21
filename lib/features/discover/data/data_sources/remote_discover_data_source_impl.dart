import 'dart:developer';

import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/discover/data/data_sources/remote_discover_data_source.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/shared/data/mappers/map_paged_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DiscoverRemoteDataSource)
class DiscoverRemoteDataSourceImpl implements DiscoverRemoteDataSource {
  final ApiService apiService;
  DiscoverRemoteDataSourceImpl({required this.apiService});
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

  @override
  Future<PageResult<MovieModel>> fetchMoviesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  ) async {
    log('fetchMoviesByGenre $genreId $page $params');
    final data = await apiService.tmdb.content.getItemsByGenre(
      type: 'movie',
      params: params,
      page: page,
      cancelToken: _refreshToken('fetchMoviesByGenre'),
    );
    return mapPagedResponse(data: data, fromJson: MovieModel.fromJson);
  }

  @override
  Future<PageResult<SeriesModel>> fetchSeriesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  ) async {
    log('fetchSeriesByGenre $genreId $page $params');
    final data = await apiService.tmdb.content.getItemsByGenre(
      type: 'tv',
      params: params,
      page: page,
      cancelToken: _refreshToken('fetchSeriesByGenre'),
    );
    return mapPagedResponse(data: data, fromJson: SeriesModel.fromJson);
  }

  @override
  Future<PageResult<MovieModel>> fetchMoviesItemsByKeyword(
    int page,
    int keyword,
  ) async {
    final data = await apiService.tmdb.content.getItemsByKeyword(
      page: page,
      keyword: keyword,
      cancelToken: _refreshToken('fetchMoviesItemsByKeyword'),
    );
    return mapPagedResponse(data: data, fromJson: MovieModel.fromJson);
  }

  @override
  Future<PageResult<SeriesModel>> fetchSeriesItemsByKeyword(
    int page,
    int keyword,
  ) async {
    final data = await apiService.tmdb.content.getItemsByKeyword(
      page: page,
      keyword: keyword,
      cancelToken: _refreshToken('fetchTvItemsByKeyword'),
      type: 'tv',
    );
    return mapPagedResponse(data: data, fromJson: SeriesModel.fromJson);
  }
}
