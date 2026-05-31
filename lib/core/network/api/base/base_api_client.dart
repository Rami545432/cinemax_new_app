// lib/core/network/api/base/base_api_client.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:movify/core/network/client/dio_client.dart';
import 'package:movify/core/types/api_types.dart';

/// Base API client that can be reused for any API provider.
///
/// Depends on [DioClient] (injected) instead of static singletons.
abstract class BaseApiClient {
  final DioClient dioClient;
  final String baseUrl;
  String _language;

  BaseApiClient({
    required this.dioClient,
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
    final requestOptions = dioClient.cacheRequestOptions(
      overridePolicy: overridePolicy,
    );

    final url = buildUrl(
      path,
      queryParams: queryParams,
      defaultParams: defaultParams,
    );

    final response = await dioClient.dio.get<JsonMap>(
      url,
      cancelToken: cancelToken,
      options: requestOptions,
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message: 'Response body was null',
      );
    }

    return data;
  }
}
