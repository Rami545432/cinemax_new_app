import 'dart:developer';

import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_state.dart';
import 'package:cinemax_app_new/features/auth/routing/auth_routes.dart';
import 'package:cinemax_app_new/features/details/routing/details_routes.dart';
import 'package:cinemax_app_new/features/discover/routing/discover_routing.dart';
import 'package:cinemax_app_new/features/onboarding/routing/on_boarding_routes.dart';
import 'package:cinemax_app_new/features/search/routing/search_routes.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_state.dart';
import 'package:cinemax_app_new/shared/presentation/routing/main_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  GoRouter createRouter() {
    final sessionCubit = getIt.get<SessionCubit>();
    final settingsCubit = getIt.get<SettingsCubit>();

    return GoRouter(
      routes: routes,
      redirect: (context, state) => _redirect(
        sessionCubit.state,
        settingsCubit.state,
        state.matchedLocation,
      ),

      initialLocation: RoutePaths.root,
      debugLogDiagnostics: true,
    );
  }

  String? _redirect(
    SessionState sessionState,
    SettingsState settingsState,
    String currentPath,
  ) {
    log(
      '🔄 Redirect | Session: ${sessionState.runtimeType} | Settings: ${settingsState.runtimeType} | Path: $currentPath',
    );

    // 1️⃣ App just started – wait (splash decides)
    if (sessionState is SessionUnknown || settingsState is SettingsUnknown) {
      return currentPath == RoutePaths.root ? null : RoutePaths.root;
    }

    // 2️⃣ First time → onboarding
    if (settingsState is SettingsLoaded && settingsState.isFirstTime) {
      final onboardingRoutes = {
        RoutePaths.boardingZero,
        RoutePaths.onBoardingPageView,
        RoutePaths.boardingOne,
        RoutePaths.boardingTwo,
        RoutePaths.boardingThree,
      };

      if (!onboardingRoutes.contains(currentPath)) {
        log('➡️  Redirecting to onboarding');
        return RoutePaths.boardingZero;
      }
      log('✅ Already at onboarding');
      return null;
    }

    // 3️⃣ Guest or authenticated → home
    if (sessionState is SessionGuest || sessionState is SessionAuthenticated) {
      final blocked = {RoutePaths.root, RoutePaths.boardingZero};

      return blocked.contains(currentPath) ? RoutePaths.home : null;
    }

    // 4️⃣ Fallback – do nothing
    return null;
  }

  List<RouteBase> routes = [
    ...AuthRoutes.routes,
    ...MainRoutes.routes,
    ...DetailsRoutes.routes,
    ...SearchRoutes.routes,
    ...DiscoverRouting.routes,
    ...OnBoardingRoutes.routes,
  ];
}
