// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:movify/core/utils/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.log('🚀 ${options.method} ${options.path}');
    if (options.queryParameters.isNotEmpty) {
      AppLogger.log('📝 Query: ${options.queryParameters}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('✅ ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.log('❌ ${err.type} ${err.requestOptions.path}');
    if (err.response != null) {
      AppLogger.log('Status: ${err.response!.statusCode}');
    }
    handler.next(err);
  }
}
