import 'translation.dart';

class Translations {
  List<Translation>? translations;

  Translations({this.translations});

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    translations: (json['translations'] as List<dynamic>?)
        ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'translations': translations?.map((e) => e.toJson()).toList(),
  };
}
