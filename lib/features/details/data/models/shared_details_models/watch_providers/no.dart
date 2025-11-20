import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class No {
  String? link;
  List<Flatrate>? flatrate;

  No({this.link, this.flatrate});

  factory No.fromJson(Map<String, dynamic> json) => No(
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
