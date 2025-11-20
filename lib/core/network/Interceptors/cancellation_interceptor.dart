import 'dart:developer';

import 'package:dio/dio.dart';

class CancellationInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.cancel) {
      log('Request cancelled: ${err.requestOptions.uri}');
      err.requestOptions.extra['is_cancelled'] = true;
    }
    handler.next(err);
  }
}
