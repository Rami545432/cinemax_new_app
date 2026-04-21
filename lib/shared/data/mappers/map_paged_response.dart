import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';

PageResult<T> mapPagedResponse<T>({
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    final items = (data['results'] as List)
        .where((e) => e['poster_path'] != null)
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();

    return PageResult<T>(
      page: data['page'] as int,
      totalPages: data['total_pages'] as int,
      totalResults: data['total_results'] as int,
      results: items,
    );
  }
