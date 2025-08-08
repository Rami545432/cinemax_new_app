import 'package:dio/dio.dart';
import 'base_pagination_params.dart';

class AiringTodayParams extends BasePaginationParams {
  const AiringTodayParams({required super.type, super.page, super.cancelToken});

  @override
  AiringTodayParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) {
    return AiringTodayParams(
      type: type ?? this.type,
      page: page ?? this.page,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
