import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Ch {
  String? link;
  List<Flatrate>? flatrate;

  Ch({this.link, this.flatrate});

  factory Ch.fromJson(Map<String, dynamic> json) => Ch(
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
