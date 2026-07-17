import 'package:dio/dio.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_configration.dart';
import 'package:movify/core/types/api_types.dart';

/// Details, recommendations, and similar content API
/// Works for both movies and TV with type parameter
class TmdbDetailsApi {
  final TmdbBaseClient client;

  TmdbDetailsApi(this.client);

  /// Get details (movies or TV)
  ApiResponse getDetails({
    required int id,
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) => client.get(
    '$type/$id',
    queryParams: {
      'page': page.toString(),
      'append_to_response': TmdbConfig.appendToResponse.toString(),
      'include_image_language': TmdbConfig.includeImageLanguage,
      'include_video_language': TmdbConfig.includeVideoLanguage,
    },
    cancelToken: cancelToken,
  );

  /// Get recommendations (movies or TV)
  ApiResponse getRecommendations({
    required int id,
    required String type, // 'movie' or 'tv'
    int? page,
    CancelToken? cancelToken,
  }) => client.get(
    '$type/$id/recommendations',
    queryParams: {if (page != null) 'page': page.toString()},
    cancelToken: cancelToken,
  );

  /// Get similar content (movies or TV)
  ApiResponse getSimilar({
    required int id,
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) => client.get(
    '$type/$id/similar',
    queryParams: {'page': page.toString()},
    cancelToken: cancelToken,
  );

  // ========== TV-SPECIFIC METHOD ==========

  /// Get season details (TV only)
  ApiResponse getSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) => client.get(
    'tv/$tvid/season/$season',
    cancelToken: cancelToken,
    queryParams: {
      'append_to_response': TmdbConfig.appendToResponse.toString(),
      'include_image_language': TmdbConfig.includeImageLanguage,
      'include_video_language': TmdbConfig.includeVideoLanguage,
    },
  );

  ApiResponse getCollection({required int id, CancelToken? cancelToken}) =>
      client.get('collection/$id', cancelToken: cancelToken);
}
