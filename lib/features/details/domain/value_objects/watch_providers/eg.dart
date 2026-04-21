import 'package:cinemax_app_new/features/details/domain/value_objects/flatrate.dart';

class Eg {
  String? link;
  List<Flatrate>? flatrate;

  Eg({this.link, this.flatrate});

  factory Eg.fromJson(Map<String, dynamic> json) => Eg(
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
