import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final bool isSystemDefault;

  const LanguageState({required this.locale, this.isSystemDefault = false});

  @override
  List<Object?> get props => [locale, isSystemDefault];

  Map<String, dynamic> toJson() => {
    'languageCode': locale.languageCode,
    'countryCode': locale.countryCode,
    'isSystemDefault': isSystemDefault,
  };

  factory LanguageState.fromJson(Map<String, dynamic> json) => LanguageState(
    locale: Locale(
      json['languageCode'] as String,
      json['countryCode'] as String?,
    ),
    isSystemDefault: json['isSystemDefault'] as bool? ?? false,
  );
}
