import 'results.dart';

class WatchProviders {
  Results? results;

  WatchProviders({this.results});

  factory WatchProviders.fromJson(Map<String, dynamic> json) {
    return WatchProviders(
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'results': results?.toJson()};
}
