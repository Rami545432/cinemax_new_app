import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';
import 'package:dio/dio.dart';

class TrendingParams extends BasePaginationParams {
  const TrendingParams({required super.type, super.page, super.cancelToken});

  @override
  TrendingParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) => TrendingParams(
    type: type ?? this.type,
    page: page ?? this.page,
    cancelToken: cancelToken ?? this.cancelToken,
  );
}
