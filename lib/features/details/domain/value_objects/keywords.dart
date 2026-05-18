import 'package:movify/features/details/domain/value_objects/keyword_results.dart';

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
