import 'package:cinemax_app_new/features/details/domain/value_objects/flatrate.dart';

class Dk {
  String? link;
  List<Flatrate>? flatrate;

  Dk({this.link, this.flatrate});

  factory Dk.fromJson(Map<String, dynamic> json) => Dk(
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
