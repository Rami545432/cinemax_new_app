import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Be {
  String? link;
  List<Flatrate>? flatrate;

  Be({this.link, this.flatrate});

  factory Be.fromJson(Map<String, dynamic> json) => Be(
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
