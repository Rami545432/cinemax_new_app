import '../flatrate.dart';

class Ad {
  String? link;
  List<Flatrate>? flatrate;

  Ad({this.link, this.flatrate});

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
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
