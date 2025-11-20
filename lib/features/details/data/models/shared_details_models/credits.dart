import 'cast.dart';
import 'crew.dart';

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({this.cast, this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
    cast:
        (json['cast'] as List<dynamic>?)
            ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
            .where((castNumber) => castNumber.profilePath != null)
            .toList() ??
        <Cast>[], // fallback here
    crew:
        (json['crew'] as List<dynamic>?)
            ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
            .where((castNumber) => castNumber.profilePath != null)
            .toList() ??
        <Crew>[], // fallback here
  );

  Map<String, dynamic> toJson() => {
    'cast': cast?.map((e) => e.toJson()).toList(),
    'crew': crew?.map((e) => e.toJson()).toList(),
  };
}
