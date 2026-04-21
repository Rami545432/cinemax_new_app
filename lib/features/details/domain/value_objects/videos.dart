import 'package:cinemax_app_new/features/details/domain/value_objects/result.dart';

class Videos {
  List<Result>? results;

  Videos({this.results});

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    results:
        (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList() ??
        <Result>[], // fallback here
  );

  Map<String, dynamic> toJson() => {
    'results': results?.map((e) => e.toJson()).toList(),
  };
}
