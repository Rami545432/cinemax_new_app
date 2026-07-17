import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Nl {
  String? link;
  List<Flatrate>? flatrate;

  Nl({this.link, this.flatrate});

  factory Nl.fromJson(Map<String, dynamic> json) => Nl(
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
