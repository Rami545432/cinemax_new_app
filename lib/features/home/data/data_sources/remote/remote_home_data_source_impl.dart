import 'package:dio/dio.dart';
import 'package:movify/core/network/api/services/api_service.dart';
import 'package:movify/core/types/data_source_types.dart';
import 'package:movify/features/home/data/data_sources/remote/remote_home_data_source.dart';
import 'package:movify/features/home/data/models/movie_model.dart';
import 'package:movify/features/home/data/models/series_model.dart';
import 'package:movify/shared/data/mappers/map_paged_response.dart';

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource {
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

  RemoteHomeDataSourceImpl({required this.apiService});
  @override
  RemoteDataSourceListMovieModel getMovies({
    int page = 1,
    String endPoint = 'popular',
  }) async {
    final data = await apiService.tmdb.content.getMovies(
      page: page,
      endPoint: endPoint,
      cancelToken: _refreshToken('movies_$endPoint'),
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => MovieModel.fromJson(json),
    );
  }

  @override
  RemoteDataSourceListSeriesModel getTvShows({
    int page = 1,
    String endPoint = 'popular',
  }) async {
    final data = await apiService.tmdb.content.getTvShows(
      page: page,
      endPoint: endPoint,
      cancelToken: _refreshToken('tv_$endPoint'),
    );
    return mapPagedResponse(
      data: data,
      fromJson: (json) => SeriesModel.fromJson(json),
    );
  }
}
