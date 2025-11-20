import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class Es {
  String? link;
  List<Flatrate>? flatrate;

  Es({this.link, this.flatrate});

  factory Es.fromJson(Map<String, dynamic> json) => Es(
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
