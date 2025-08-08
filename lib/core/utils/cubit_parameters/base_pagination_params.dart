import 'package:dio/dio.dart';

class BasePaginationParams {
  final String type;
  final int? page;
  final CancelToken? cancelToken;
  const BasePaginationParams({
    required this.type,
    required this.page,
    this.cancelToken,
  });
  BasePaginationParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) {
    return BasePaginationParams(
      type: type ?? this.type,
      page: page ?? this.page,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }

  Map<String, dynamic> toQueryMap() {
    return {'type': type, 'page': page};
  }
}
