import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';
import 'package:dio/dio.dart';

class TopRatedParams extends BasePaginationParams {
  final dynamic generId;

  const TopRatedParams({
    required super.type,
    super.page,
    this.generId,
    super.cancelToken,
  });

  @override
  TopRatedParams copyWith({
    String? type,
    int? page,
    dynamic generId,
    CancelToken? cancelToken,
  }) => TopRatedParams(
    type: type ?? this.type,
    page: page ?? this.page,
    generId: generId ?? this.generId,
    cancelToken: cancelToken ?? this.cancelToken,
  );
}
