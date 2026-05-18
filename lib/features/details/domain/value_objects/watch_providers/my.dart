import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class My {
  String? link;
  List<Flatrate>? flatrate;

  My({this.link, this.flatrate});

  factory My.fromJson(Map<String, dynamic> json) => My(
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
