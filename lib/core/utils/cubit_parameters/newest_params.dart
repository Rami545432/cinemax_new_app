import 'package:dio/dio.dart';
import 'base_pagination_params.dart';

class NewestParams extends BasePaginationParams {
  const NewestParams({required super.type, super.page, super.cancelToken});

  @override
  NewestParams copyWith({String? type, int? page, CancelToken? cancelToken}) {
    return NewestParams(
      type: type ?? this.type,
      page: page ?? this.page,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
