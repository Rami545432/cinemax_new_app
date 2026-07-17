import 'package:movify/features/details/domain/value_objects/flatrate.dart';

class Mt {
  String? link;
  List<Flatrate>? flatrate;

  Mt({this.link, this.flatrate});

  factory Mt.fromJson(Map<String, dynamic> json) => Mt(
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
