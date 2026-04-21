import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';
import 'package:dio/dio.dart';

class AiringTodayParams extends BasePaginationParams {
  const AiringTodayParams({required super.type, super.page, super.cancelToken});

  @override
  AiringTodayParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) => AiringTodayParams(
    type: type ?? this.type,
    page: page ?? this.page,
    cancelToken: cancelToken ?? this.cancelToken,
  );
}
