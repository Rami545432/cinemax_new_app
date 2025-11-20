import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class TmdbSearchApi {
  final TmdbBaseClient client;

  TmdbSearchApi(this.client);
  ApiResposne searchMovies(String query, {CancelToken? cancelToken}) {
    return client.get(
      'search/movie',
      queryParams: {'query': query},
      cancelToken: cancelToken,
      overridePolicy: CachePolicy.noCache,
    );
  }

  ApiResposne searchTvShows(String query, {CancelToken? cancelToken}) {
    return client.get(
      'search/tv',
      queryParams: {'query': query},
      cancelToken: cancelToken,
      overridePolicy: CachePolicy.noCache,
    );
  }

  ApiResposne searchActors(String query, {CancelToken? cancelToken}) {
    return client.get(
      'search/person',
      queryParams: {'query': query},
      cancelToken: cancelToken,
      overridePolicy: CachePolicy.noCache,
    );
  }
}
