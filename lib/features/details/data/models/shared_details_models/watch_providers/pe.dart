import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class Pe {
  String? link;
  List<Flatrate>? flatrate;

  Pe({this.link, this.flatrate});

  factory Pe.fromJson(Map<String, dynamic> json) => Pe(
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
