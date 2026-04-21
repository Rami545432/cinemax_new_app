import 'package:dio/dio.dart';

class DetailsParams {
  final int id;
  final String type;
  final CancelToken? cancelToken;

  const DetailsParams({required this.id, required this.type, this.cancelToken});
}
