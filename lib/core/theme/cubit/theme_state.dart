import 'package:flutter/material.dart';

enum AppColorScheme {
  blue,
  green,
  purple,
  red,
  orange,
  veryDarkBlue,
  softBlue,
  blueAccent,
  black,
}

class ThemeState {
  final AppColorScheme colorScheme;
  final ThemeMode themeMode;

  const ThemeState({
    this.colorScheme = AppColorScheme.veryDarkBlue,
    this.themeMode = ThemeMode.dark,
  });
  ThemeState copyWith({AppColorScheme? colorScheme, ThemeMode? themeMode}) {
    return ThemeState(
      colorScheme: colorScheme ?? this.colorScheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toJson() {
    return {'colorScheme': colorScheme.name, 'themeMode': themeMode.name};
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      colorScheme: AppColorScheme.values.firstWhere(
        (colorScheme) => colorScheme.name == json['colorScheme'],
        orElse: () => AppColorScheme.blue,
      ),
      themeMode: ThemeMode.values.firstWhere(
        (mode) => mode.name == json['themeMode'],
        orElse: () => ThemeMode.dark,
      ),
    );
  }
}
