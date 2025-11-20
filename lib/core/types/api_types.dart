import 'package:dio/dio.dart';

typedef ApiResposne = Future<JsonMap>;
typedef JsonMap = Map<String, dynamic>;
typedef CancellableApiCall<T> = Future<T> Function(CancelToken? cancelToken);
