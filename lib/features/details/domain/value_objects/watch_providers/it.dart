import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class It {
  String? link;
  List<Flatrate>? flatrate;

  It({this.link, this.flatrate});

  factory It.fromJson(Map<String, dynamic> json) => It(
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
