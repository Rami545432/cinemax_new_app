import 'package:dio/dio.dart';
import 'base_pagination_params.dart';

class TrendingParams extends BasePaginationParams {
  const TrendingParams({required super.type, super.page, super.cancelToken});

  @override
  TrendingParams copyWith({String? type, int? page, CancelToken? cancelToken}) {
    return TrendingParams(
      type: type ?? this.type,
      page: page ?? this.page,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
