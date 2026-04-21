import 'package:cinemax_app_new/core/utils/cubit_parameters/base_pagination_params.dart';

class PopularParams extends BasePaginationParams {
  final String? sortBy;
  const PopularParams({
    required super.type,
    super.page,
    this.sortBy,
    super.cancelToken,
  });
}
