import 'data.dart';

class Translation {
  String? iso31661;
  String? iso6391;
  String? name;
  String? englishName;
  Data? data;

  Translation({
    this.iso31661,
    this.iso6391,
    this.name,
    this.englishName,
    this.data,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    iso31661: json['iso_3166_1'] as String?,
    iso6391: json['iso_639_1'] as String?,
    name: json['name'] as String?,
    englishName: json['english_name'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'iso_3166_1': iso31661,
    'iso_639_1': iso6391,
    'name': name,
    'english_name': englishName,
    'data': data?.toJson(),
  };
}
