// lib/features/theme/cubit/theme_state.dart

import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode mode;
  final Color accentColor;
  final double fontSize;

  const ThemeState({
    required this.mode,
    required this.accentColor,
    required this.fontSize,
  });

  // Initial / default state
  factory ThemeState.initial() => const ThemeState(
    mode: ThemeMode.dark,
    accentColor: Colors.black,
    fontSize: 14.0,
  );

  ThemeState copyWith({
    ThemeMode? mode,
    Color? accentColor,
    double? fontSize,
  }) => ThemeState(
    mode: mode ?? this.mode,
    accentColor: accentColor ?? this.accentColor,
    fontSize: fontSize ?? this.fontSize,
  );

  // Serialization
  Map<String, dynamic> toJson() => {
    'mode': mode.name,
    'accentColor': accentColor.toARGB32(), // stored as int
    'fontSize': fontSize,
  };

  factory ThemeState.fromJson(Map<String, dynamic> json) => ThemeState(
    mode: ThemeMode.values.byName(json['mode'] as String),
    accentColor: Color(json['accentColor'] as int),
    fontSize: json['fontSize'] as double,
  );
}
