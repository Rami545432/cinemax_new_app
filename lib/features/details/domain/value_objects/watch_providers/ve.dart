import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Ve {
  String? link;
  List<Flatrate>? flatrate;

  Ve({this.link, this.flatrate});

  factory Ve.fromJson(Map<String, dynamic> json) => Ve(
    link: json['link'] as String?,
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
  };
}
