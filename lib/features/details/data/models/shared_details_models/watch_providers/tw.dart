import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class Tw {
  String? link;
  List<Flatrate>? flatrate;

  Tw({this.link, this.flatrate});

  factory Tw.fromJson(Map<String, dynamic> json) => Tw(
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
