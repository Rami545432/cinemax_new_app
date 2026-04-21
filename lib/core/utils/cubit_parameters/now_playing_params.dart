import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';
import 'package:dio/dio.dart';

class NowPlayingParams extends BasePaginationParams {
  const NowPlayingParams({required super.type, super.page, super.cancelToken});

  @override
  NowPlayingParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) => NowPlayingParams(
    type: type ?? this.type,
    page: page ?? this.page,
    cancelToken: cancelToken ?? this.cancelToken,
  );
}
