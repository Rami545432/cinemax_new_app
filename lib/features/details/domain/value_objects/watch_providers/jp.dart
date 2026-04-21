import 'package:cinemax_app_new/features/details/domain/value_objects/flatrate.dart';

class Jp {
  String? link;
  List<Flatrate>? flatrate;

  Jp({this.link, this.flatrate});

  factory Jp.fromJson(Map<String, dynamic> json) => Jp(
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
