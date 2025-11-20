import 'package:dio/dio.dart';
import 'dart:developer';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can add global error handling here
    // For example, automatic retry for certain errors

    if (err.type == DioExceptionType.connectionTimeout) {
      log('🔄 Connection timeout, you might want to retry');
    }

    handler.next(err);
  }
}
