import 'package:dio/dio.dart';

import '../api/services/api_service.dart';

class DioConfig {
  static BaseOptions get baseOptions => BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    baseUrl: ApiService.baseUrl,

    // Headers
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},

    // Response type
    responseType: ResponseType.json,

    // Follow redirects
    followRedirects: true,
    maxRedirects: 3,
  );
  static const int maxRetries = 3;
  static const Duration baseDelay = Duration(milliseconds: 1000);
  static const List<int> retryableStatusCodes = [
    500, // Internal Server Error
    502, // Bad Gateway
    503, // Service Unavailable
    504, // Gateway Timeout
    429, // Too Many Requests
  ];
}
