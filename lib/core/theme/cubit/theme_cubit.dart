import 'dart:convert';

import 'package:cinemax_app_new/core/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme';
  final SharedPreferences _prefs;
  ThemeCubit(this._prefs) : super(const ThemeState()) {
    _loadTheme();
  }

  void _loadTheme() async {
    final savedTheme = _prefs.getString(_themeKey);
    if (savedTheme != null) {
      try {
        final json = jsonDecode(savedTheme);
        emit(ThemeState.fromJson(json));
      } catch (e) {
        emit(const ThemeState());
      }
    }
  }

  Future<void> _saveTheme(ThemeState newState) async {
    await _prefs.setString(_themeKey, jsonEncode(newState.toJson()));
    emit(newState);
  }

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    final newState = state.copyWith(themeMode: newMode);
    await _saveTheme(newState);
  }

  Future<void> setColorScheme(AppColorScheme colorScheme) async {
    final newState = state.copyWith(colorScheme: colorScheme);
    await _saveTheme(newState);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final newState = state.copyWith(themeMode: themeMode);
    await _saveTheme(newState);
  }

  bool get isDark => state.themeMode == ThemeMode.dark;
  bool get isLight => state.themeMode == ThemeMode.light;
}
