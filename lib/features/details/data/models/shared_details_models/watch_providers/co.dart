import 'package:cinemax_app_new/features/details/data/models/shared_details_models/flatrate.dart';

class Co {
  String? link;
  List<Flatrate>? flatrate;

  Co({this.link, this.flatrate});

  factory Co.fromJson(Map<String, dynamic> json) => Co(
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
