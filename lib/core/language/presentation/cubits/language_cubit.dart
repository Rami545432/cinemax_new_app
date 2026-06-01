import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/language/presentation/cubits/language_state.dart';
import 'package:movify/core/network/api/services/api_service.dart';

class LanguageCubit extends HydratedCubit<LanguageState>
    with WidgetsBindingObserver {
  LanguageCubit() : super(_getInitialState()) {
    WidgetsBinding.instance.addObserver(this);
  }

  static LanguageState _getInitialState() {
    final systemLocale = _getSystemFallbackLocale(
      ui.PlatformDispatcher.instance.locale,
    );
    return LanguageState(locale: systemLocale, isSystemDefault: true);
  }

  static Locale _getSystemFallbackLocale(Locale systemLocale) {
    final langCode = systemLocale.languageCode;
    if (['ar', 'en', 'tr', 'fr', 'es'].contains(langCode)) {
      return Locale(langCode);
    }
    return const Locale('en'); // fallback
  }

  void changeLanguage(String languageCode, {bool isSystemDefault = false}) {
    if (isSystemDefault) {
      final systemLocale = _getSystemFallbackLocale(
        ui.PlatformDispatcher.instance.locale,
      );
      emit(LanguageState(locale: systemLocale, isSystemDefault: true));
      updateApiServiceLanguage(systemLocale.languageCode);
    } else {
      emit(LanguageState(locale: Locale(languageCode)));
      updateApiServiceLanguage(languageCode);
    }
  }

  bool get isRTL => state.locale.languageCode == 'ar';

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (state.isSystemDefault && locales != null && locales.isNotEmpty) {
      final newLocale = _getSystemFallbackLocale(locales.first);
      emit(LanguageState(locale: newLocale, isSystemDefault: true));
      updateApiServiceLanguage(newLocale.languageCode);
    }
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  void updateApiServiceLanguage(String languageCode) {
    if (getIt.isRegistered<ApiService>()) {
      getIt.get<ApiService>().updateLanguage(languageCode);
    }
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

  @override
  Map<String, dynamic> toJson(LanguageState state) => state.toJson();

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    try {
      return LanguageState.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}
