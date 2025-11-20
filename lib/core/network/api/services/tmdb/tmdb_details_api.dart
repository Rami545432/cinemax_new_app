import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_configration.dart';
import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// Details, recommendations, and similar content API
/// Works for both movies and TV with type parameter
class TmdbDetailsApi {
  final TmdbBaseClient client;

  TmdbDetailsApi(this.client);

  /// Get details (movies or TV)
  ApiResposne getDetails({
    required int id,
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    final url =
        '${client.buildUrl('$type/$id', queryParams: {'page': page.toString()})}&${TmdbConfig.additionalData}';

    final policy = AppDio.hasConnectivity
        ? CachePolicy.request
        : CachePolicy.forceCache;
    final requestOptions = await AppDio.cacheOptions.then(
      (value) => value.copyWith(policy: policy).toOptions(),
    );

    final response = await client.dio.get(
      url,
      cancelToken: cancelToken,
      options: requestOptions,
    );

    return response.data;
  }

  /// Get recommendations (movies or TV)
  ApiResposne getRecommendations({
    required int id,
    required String type, // 'movie' or 'tv'
    int? page,
    CancelToken? cancelToken,
  }) {
    return client.get(
      '$type/$id/recommendations',
      queryParams: {
        'without_genres': TmdbConfig.excludedRomanceGenre,
        if (page != null) 'page': page.toString(),
      },
      cancelToken: cancelToken,
    );
  }

  /// Get similar content (movies or TV)
  ApiResposne getSimilar({
    required int id,
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      '$type/$id/similar',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
    );
  }

  // ========== TV-SPECIFIC METHOD ==========

  /// Get season details (TV only)
  ApiResposne getSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) async {
    final url =
        '${client.buildUrl('tv/$tvid/season/$season')}&${TmdbConfig.additionalData}';

    final policy = AppDio.hasConnectivity
        ? CachePolicy.request
        : CachePolicy.forceCache;
    final requestOptions = await AppDio.cacheOptions.then(
      (value) => value.copyWith(policy: policy).toOptions(),
    );

    final response = await client.dio.get(
      url,
      cancelToken: cancelToken,
      options: requestOptions,
    );

    return response.data;
  }
}
