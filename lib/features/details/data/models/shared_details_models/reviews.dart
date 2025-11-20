import 'package:cinemax_app_new/features/details/data/models/shared_details_models/review_results.dart';

class Reviews {
  int? page;
  List<ReviewResults>? results;
  int? totalPages;
  int? totalResults;

  Reviews({this.page, this.results, this.totalPages, this.totalResults});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    page: json['page'] as int?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => ReviewResults.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int?,
    totalResults: json['total_results'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results?.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}
