import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Bg {
  String? link;
  List<Flatrate>? flatrate;

  Bg({this.link, this.flatrate});

  factory Bg.fromJson(Map<String, dynamic> json) => Bg(
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
