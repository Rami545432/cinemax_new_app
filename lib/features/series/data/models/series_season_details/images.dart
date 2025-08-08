import 'poster.dart';

class Images {
  List<Poster>? posters;

  Images({this.posters});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        posters: (json['posters'] as List<dynamic>?)
            ?.map((e) => Poster.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'posters': posters?.map((e) => e.toJson()).toList(),
      };
}
