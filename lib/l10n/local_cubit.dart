import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/l10n/local_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Locale Cubit
class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'selected_locale';
  final SharedPreferences sharedPreferences;
  LocaleCubit({required this.sharedPreferences})
    : super(const LocaleState(Locale('en'))) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final languageCode = sharedPreferences.getString(_localeKey);

      if (languageCode != null) {
        emit(LocaleState(Locale(languageCode)));
        _updateApiServiceLanguage(languageCode);
      }
    } catch (e) {
      // If loading fails, keep default locale
      debugPrint('Error loading locale: $e');
    }
  }

  // Change locale and save to SharedPreferences
  Future<void> changeLocale(String languageCode) async {
    try {
      await sharedPreferences.setString(_localeKey, languageCode);
      emit(LocaleState(Locale(languageCode)));
      _updateApiServiceLanguage(languageCode);
    } catch (e) {
      debugPrint('Error saving locale: $e');
    }
  }

  void _updateApiServiceLanguage(String languageCode) {
    getIt.get<ApiService>().updateLanguage(languageCode);
  }

  // Get current locale
  Locale get currentLocale => state.locale;

  // Check if current locale is RTL
  bool get isRTL => state.locale.languageCode == 'ar';

  // Toggle between English and Arabic
  Future<void> toggleLocale() async {
    final newLocale = state.locale.languageCode == 'en' ? 'ar' : 'en';
    await changeLocale(newLocale);
  }

  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      default:
        return 'English';
    }
  }

  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'name': 'English', 'flag': '🇬🇧'},
    {'code': 'ar', 'name': 'العربية', 'flag': '🇸🇦'},
    {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
    {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
    {'code': 'tr', 'name': 'Türkçe', 'flag': '🇹🇷'},
  ];
}
