import 'package:dio/dio.dart';

/// Injects the TMDB API key as a query parameter on every TMDB
/// request.
///
/// The API key is received via constructor injection from
/// [AppConfig], making this interceptor testable and decoupled
/// from the service locator.
class ApiKeyInterceptor extends Interceptor {
  final String _tmdbApiKey;

  ApiKeyInterceptor({required String tmdbApiKey}) : _tmdbApiKey = tmdbApiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add api_key to all requests — the baseUrl is already TMDB-only,
    // so every request going through this Dio needs the key.
    options.queryParameters['api_key'] = _tmdbApiKey;
    handler.next(options);
  }
}
