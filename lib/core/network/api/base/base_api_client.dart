// lib/core/network/api/base/base_api_client.dart
import 'dart:developer';
import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// Base API client that can be reused for any API provider
abstract class BaseApiClient {
  final Dio dio;
  final String baseUrl;
  String _language;

  BaseApiClient({
    required this.dio,
    required this.baseUrl,
    required String language,
  }) : _language = language;

  String get language => _language;

  void updateLanguage(String language) {
    _language = language;
  }

  /// Build URL with base URL and query parameters
  String buildUrl(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? defaultParams,
  }) {
    final uri = Uri.parse('$baseUrl/$path').replace(
      queryParameters: {
        ...?defaultParams,
        ...?queryParams,
        'language': _language,
      },
    );

    log('🔍 URL: ${uri.toString()}');
    return uri.toString();
  }

  /// Generic GET request with caching support
  Future<JsonMap> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? defaultParams,
    CancelToken? cancelToken,
    CachePolicy? overridePolicy,
  }) async {
    final policy =
        overridePolicy ??
        (AppDio.hasConnectivity ? CachePolicy.request : CachePolicy.forceCache);

    final requestOptions = await AppDio.cacheOptions.then(
      (value) => value.copyWith(policy: policy).toOptions(),
    );

    final url = buildUrl(
      path,
      queryParams: queryParams,
      defaultParams: defaultParams,
    );

    final response = await dio.get(
      url,
      cancelToken: cancelToken,
      options: requestOptions,
    );

    return response.data;
  }
}
