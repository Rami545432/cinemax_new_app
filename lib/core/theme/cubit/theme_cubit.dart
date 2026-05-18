// lib/features/theme/cubit/theme_cubit.dart

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/theme/cubit/theme_state.dart';

@lazySingleton
class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void toggleTheme() => emit(
    state.copyWith(
      mode: state.mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    ),
  );

  void setAccentColor(Color color) => emit(state.copyWith(accentColor: color));
  void setFontSize(double size) => emit(state.copyWith(fontSize: size));

  @override
  Map<String, dynamic> toJson(ThemeState state) => state.toJson();

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return ThemeState.fromJson(json);
    } catch (_) {
      return ThemeState.initial();
    }
  }
}
