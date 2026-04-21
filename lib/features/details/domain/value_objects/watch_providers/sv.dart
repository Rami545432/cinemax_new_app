import 'package:cinemax_app_new/features/details/domain/value_objects/flatrate.dart';

class Sv {
  String? link;
  List<Flatrate>? flatrate;

  Sv({this.link, this.flatrate});

  factory Sv.fromJson(Map<String, dynamic> json) => Sv(
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
