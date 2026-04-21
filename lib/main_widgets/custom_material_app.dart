import 'package:cinemax_app_new/core/language/presentation/cubits/language_cubit.dart';
import 'package:cinemax_app_new/core/network/widgets/network_statues_banner.dart';
import 'package:cinemax_app_new/core/routing/app_router.dart';
import 'package:cinemax_app_new/core/theme/config/app_theme.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
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

    // The BlocListener listens to FUTURE changes. We must handle the current
    // cold-start state that was resolved in main.dart before this widget mounted.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final authState = context.read<SessionCubit>().state;
      final favoriteCubit = context.read<FavoriteCubit>();

      if (authState is SessionAuthenticated) {
        // Cold start -> Just load from local Hive, no costly sync needed
        favoriteCubit.setUser(authState.user.uid!);
      } else if (authState is SessionGuest ||
          authState is SessionUnauthenticated) {
        favoriteCubit.setUser('guest');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localeState = context.watch<LanguageCubit>().state;
    final themeState = context.watch<ThemeCubit>().state;
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, authState) {
        final favoriteCubit = context.read<FavoriteCubit>();

        if (authState is SessionAuthenticated) {
          // Tell FavoriteCubit to auto-merge guest favorites and pull from cloud
          favoriteCubit.handleSignIn(authState.user.uid!);
        } else if (authState is SessionGuest ||
            authState is SessionUnauthenticated) {
          favoriteCubit.setUser('guest');
        }
      },
      child: MaterialApp.router(
        routerConfig: _router,
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
      ),
    );
  }
}
