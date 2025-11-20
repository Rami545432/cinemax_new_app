import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class Si {
  String? link;
  List<Flatrate>? flatrate;

  Si({this.link, this.flatrate});

  factory Si.fromJson(Map<String, dynamic> json) => Si(
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
