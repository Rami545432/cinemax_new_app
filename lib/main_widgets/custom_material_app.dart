import 'package:cinemax_app_new/core/network/widgets/network_statues_banner.dart';
import 'package:cinemax_app_new/core/routing/app_router.dart';
import 'package:cinemax_app_new/core/theme/config/app_theme.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:cinemax_app_new/l10n/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CustomMaterialApp extends StatelessWidget {
  final AppRouters appRouters;
  const CustomMaterialApp({super.key, required this.appRouters});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final localeState = context.watch<LocaleCubit>().state;
    return MaterialApp.router(
      routerConfig: appRouters.router,
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
    );
  }
}
