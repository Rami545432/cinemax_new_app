import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keyword_results.dart';

class Keywords {
  List<KeywordResults>? results;

  Keywords({this.results});

  factory Keywords.fromJson(Map<String, dynamic> json) => Keywords(
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => KeywordResults.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'results': results?.map((e) => e.toJson()).toList(),
  };
}
