// ignore_for_file: strict_raw_type

import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('🚀 ${options.method} ${options.path}');
    if (options.queryParameters.isNotEmpty) {
      log('📝 Query: ${options.queryParameters}');
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
    log('❌ ${err.type} ${err.requestOptions.path}');
    if (err.response != null) {
      log('Status: ${err.response!.statusCode}');
    }
    handler.next(err);
  }
}
