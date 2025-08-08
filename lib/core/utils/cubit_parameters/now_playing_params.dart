import 'package:dio/dio.dart';
import 'base_pagination_params.dart';

class NowPlayingParams extends BasePaginationParams {
  const NowPlayingParams({required super.type, super.page, super.cancelToken});

  @override
  NowPlayingParams copyWith({
    String? type,
    int? page,
    CancelToken? cancelToken,
  }) {
    return NowPlayingParams(
      type: type ?? this.type,
      page: page ?? this.page,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
