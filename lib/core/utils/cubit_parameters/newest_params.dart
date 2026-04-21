import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';
import 'package:dio/dio.dart';

class NewestParams extends BasePaginationParams {
  const NewestParams({required super.type, super.page, super.cancelToken});

  @override
  NewestParams copyWith({String? type, int? page, CancelToken? cancelToken}) =>
      NewestParams(
        type: type ?? this.type,
        page: page ?? this.page,
        cancelToken: cancelToken ?? this.cancelToken,
      );
}
