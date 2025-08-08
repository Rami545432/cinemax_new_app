import 'package:dio/dio.dart';
import 'base_pagination_params.dart';

class TopRatedParams extends BasePaginationParams {
  final dynamic generId;

  const TopRatedParams({
    required super.type,
    super.page,
    this.generId,
    super.cancelToken,
  });

  @override
  Map<String, dynamic> toQueryMap() {
    final queryMap = super.toQueryMap();
    if (generId != null) queryMap['with_genres'] = generId;
    return queryMap;
  }

  @override
  TopRatedParams copyWith({
    String? type,
    int? page,
    dynamic generId,
    CancelToken? cancelToken,
  }) {
    return TopRatedParams(
      type: type ?? this.type,
      page: page ?? this.page,
      generId: generId ?? this.generId,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
