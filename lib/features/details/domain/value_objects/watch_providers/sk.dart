import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Sk {
  String? link;
  List<Flatrate>? flatrate;

  Sk({this.link, this.flatrate});

  factory Sk.fromJson(Map<String, dynamic> json) => Sk(
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
