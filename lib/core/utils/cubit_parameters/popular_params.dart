import 'base_pagination_params.dart';

class PopularParams extends BasePaginationParams {
  final String? sortBy;
  const PopularParams({
    required super.type,
    super.page,
    this.sortBy,
    super.cancelToken,
  });
  @override
  Map<String, dynamic> toQueryMap() {
    final queryMap = super.toQueryMap();
    if (sortBy != null) queryMap['with_genres'] = sortBy;
    queryMap['with_out_genres'] = '10749';

    return queryMap;
  }
}
