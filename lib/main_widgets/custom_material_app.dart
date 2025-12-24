import 'package:cinemax_app_new/core/network/widgets/network_statues_banner.dart';
import 'package:cinemax_app_new/core/routing/app_router.dart';
import 'package:cinemax_app_new/core/theme/config/app_theme.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:cinemax_app_new/l10n/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class CustomMaterialApp extends StatefulWidget {
  const CustomMaterialApp({super.key});

  @override
  State<CustomMaterialApp> createState() => _CustomMaterialAppState();
}

class _CustomMaterialAppState extends State<CustomMaterialApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouters().createRouter();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final localeState = context.watch<LocaleCubit>().state;
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      builder: (context, child) {
        return Stack(children: [child!, const NetworkStatusBanner()]);
      },

      theme: AppTheme.light(themeState.colorScheme),
      darkTheme: AppTheme.dark(themeState.colorScheme),
      themeMode: themeState.themeMode,
      locale: localeState.locale,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 300),
    );
  }
}
