// lib/core/network/api/services/tmdb/tmdb_base_client.dart
import 'package:cinemax_app_new/core/network/api/base/base_api_client.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_configration.dart';

/// TMDB-specific API client extending the base client
class TmdbBaseClient extends BaseApiClient {
  TmdbBaseClient({required super.dio, required super.language})
    : super(baseUrl: TmdbConfig.baseUrl);

  @override
  String buildUrl(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? defaultParams,
  }) {
    return super.buildUrl(
      path,
      queryParams: queryParams,
      defaultParams: defaultParams ?? TmdbConfig.defaultParams,
    );
  }
}
