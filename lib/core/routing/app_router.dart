import 'dart:developer';

import 'package:cinemax_app_new/core/routing/core/refresh_stream.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:cinemax_app_new/features/auth/routing/auth_routes.dart';
import 'package:cinemax_app_new/features/home/routing/home_routes.dart';
import 'package:cinemax_app_new/features/main/presentation/routes/main_routes.dart';
import 'package:cinemax_app_new/features/search/routing/search_routes.dart';
import 'package:cinemax_app_new/features/series/routing/series_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  final AuthCubit authCubit;
  late final GoRouter router;
  late final GoRouterRefreshStream _refreshStream;

  AppRouters({required this.authCubit}) {
    _refreshStream = GoRouterRefreshStream(authCubit.stream);
    router = GoRouter(
      routes: routes,
      redirect: _redirect,
      refreshListenable: _refreshStream,
      initialLocation: RoutePaths.root,
      debugLogDiagnostics: true,
    );
  }
  String? _redirect(BuildContext context, GoRouterState state) {
    final authState = authCubit.state;
    final currentPath = state.matchedLocation;

    log('🔄 ===== REDIRECT CALLED =====');
    log('📍 Current Path: $currentPath');
    log('🔐 Auth State: ${authState.runtimeType}');

    // While loading, stay put
    if (authState is AuthInitial || authState is AuthLoading) {
      log('⏳ Still loading, staying at current path');
      return null;
    }

    // First time user
    if (authState is AuthFirstTime) {
      if (currentPath != RoutePaths.onBoarding) {
        log('➡️  Redirecting to onboarding');
        return RoutePaths.onBoarding;
      }
      log('✅ Already at onboarding');
      return null;
    }

    // Unauthenticated
    if (authState is AuthUnauthenticated) {
      if (currentPath != RoutePaths.initialAuth) {
        log('➡️  Redirecting to auth');
        return RoutePaths.initialAuth;
      }
      log('✅ Already at auth');
      return null;
    }

    // Authenticated or Guest
    if (authState is AuthAuthenticated || authState is AuthGuest) {
      final authScreens = [
        RoutePaths.root,
        RoutePaths.initialAuth,
        RoutePaths.onBoarding,
      ];

      if (authScreens.contains(currentPath)) {
        log('➡️  User is authenticated, redirecting to home');
        return RoutePaths.home;
      }

      log('✅ User authenticated, allowing navigation to $currentPath');
      return null;
    }

    log('❌ Unhandled state, staying at current path');
    return null;
  }

  List<RouteBase> get routes => [
    ...AuthRoutes.routes,
    ...MainRoutes.routes,
    ...SearchRoutes.routes,
    ...SeriesRoutes.routes,
    ...HomeRoutes.routes,
  ];
  void dispose() {
    _refreshStream.dispose();
  }
}
