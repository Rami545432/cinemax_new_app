import 'package:dio/dio.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_configration.dart';

/// Centralized Dio configuration.
///
/// All timeout, header, and retry constants live here so they're
/// easy to find, tune, and test.
class DioConfig {
  static BaseOptions get baseOptions => BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    baseUrl: TmdbConfig.baseUrl,

    // Standard headers applied to every request.
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': 'en-US',
      'User-Agent': 'CinemaxApp/1.0',
      'X-Platform': 'mobile',
    },

    // Follow redirects
    followRedirects: true,
    maxRedirects: 3,
  );

  // ── Retry configuration ───────────────────────────────────────────
  static const int maxRetries = 3;
  static const Duration baseDelay = Duration(milliseconds: 1000);

  /// Progressive delays: 1s, 2s, 3s (derived from [baseDelay] × index).
  static List<Duration> get retryDelays => List.generate(
    maxRetries,
    (i) => baseDelay * (i + 1),
  );

  static const List<int> retryableStatusCodes = [
    500, // Internal Server Error
    502, // Bad Gateway
    503, // Service Unavailable
    504, // Gateway Timeout
    429, // Too Many Requests
  ];
}
