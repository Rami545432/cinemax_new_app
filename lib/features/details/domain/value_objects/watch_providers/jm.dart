import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Jm {
  String? link;
  List<Flatrate>? flatrate;

  Jm({this.link, this.flatrate});

  factory Jm.fromJson(Map<String, dynamic> json) => Jm(
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
