import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/language/presentation/cubits/language_cubit.dart';
import 'package:movify/core/network/widgets/network_statues_banner.dart';
import 'package:movify/core/theme/config/app_theme.dart';
import 'package:movify/core/theme/cubit/theme_cubit.dart';
import 'package:movify/l10n/app_localizations.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeState = context.watch<LanguageCubit>().state;
    final themeState = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      routerConfig: getIt<GoRouter>(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      builder: (context, child) =>
          Stack(children: [child!, const NetworkStatusBanner()]),

      theme: AppTheme.light(themeState.accentColor),
      darkTheme: AppTheme.dark(themeState.accentColor),
      themeMode: themeState.mode,
      locale: localeState.locale,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 300),
    );
  }
}
