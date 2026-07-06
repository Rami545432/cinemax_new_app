import 'package:async/async.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/remote_config/remote_config_service.dart';
import 'package:movify/core/routing/core/refresh_stream.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/core/utils/app_logger.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/auth/routing/auth_routes.dart';
import 'package:movify/features/details/routing/details_routes.dart';
import 'package:movify/features/discover/routing/discover_routing.dart';
import 'package:movify/features/onboarding/routing/on_boarding_routes.dart';
import 'package:movify/features/search/routing/search_routes.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:movify/features/settings/presentation/cubits/settings_state.dart';
import 'package:movify/shared/presentation/routing/main_routes.dart';

class AppRouters {
  final SessionCubit sessionCubit;
  final SettingsCubit settingsCubit;

  AppRouters({required this.sessionCubit, required this.settingsCubit});
  GoRouter createRouter() => GoRouter(
    routes: routes,
    redirect: (context, state) => redirectLogic(
      sessionCubit.state,
      settingsCubit.state,
      state.matchedLocation,
    ),
    refreshListenable: GoRouterRefreshStream(
      StreamGroup.merge([sessionCubit.stream, settingsCubit.stream]),
    ),
    initialLocation: RoutePaths.root,

    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
  );

  String? redirectLogic(
    SessionState sessionState,
    SettingsState settingsState,
    String currentPath,
  ) {
    AppLogger.log(
      '🔄 Redirect | Session: ${sessionState.runtimeType} | Settings: ${settingsState.runtimeType} | Path: $currentPath',
    );

    // Set current route for Crashlytics context
    FirebaseCrashlytics.instance.setCustomKey('current_route', currentPath);

    // 0️⃣ Check Remote Config Blocks First (Highest Priority)
    final remoteConfig = RemoteConfigService.instance;
    if (remoteConfig.isMaintenanceMode &&
        currentPath != RoutePaths.maintenance) {
      return RoutePaths.maintenance;
    }
    if (remoteConfig.isUpdateRequired &&
        currentPath != RoutePaths.forceUpdate) {
      return RoutePaths.forceUpdate;
    }

    // 1️⃣ App just started – wait (splash decides)
    if (sessionState is SessionUnknown || settingsState is SettingsUnknown) {
      return currentPath == RoutePaths.root ? null : RoutePaths.root;
    }

    // 2️⃣ First time → onboarding
    if (settingsState is SettingsLoaded && settingsState.isFirstTime) {
      return _onboardingRoutes.contains(currentPath)
          ? null
          : RoutePaths.boardingZero;
    }

    // 3️⃣ Authenticated → block auth screens
    if (sessionState is SessionAuthenticated) {
      return _blockedWhenAuthenticated.contains(currentPath)
          ? RoutePaths.home
          : null;
    }

    // 4️⃣ Guest → block splash only
    if (sessionState is SessionGuest) {
      return _blockedWhenGuest.contains(currentPath) ? RoutePaths.home : null;
    }
    // 5️⃣ Unauthenticated → force login
    if (sessionState is SessionUnauthenticated) {
      return _blockedWhenUnauthenticated.contains(currentPath)
          ? RoutePaths.login
          : null;
    }

    return null;
  }

  static const _onboardingRoutes = {
    RoutePaths.boardingZero,
    RoutePaths.onBoardingPageView,
    RoutePaths.boardingOne,
    RoutePaths.boardingTwo,
    RoutePaths.boardingThree,
  };

  static const _blockedWhenAuthenticated = {
    RoutePaths.root,
    RoutePaths.boardingZero,
    RoutePaths.login,
  };
  static const _blockedWhenUnauthenticated = {
    RoutePaths.root,
    RoutePaths.home,
    RoutePaths.favorite,
    RoutePaths.profile,
    RoutePaths.search,
    RoutePaths.discover,
  };

  static const _blockedWhenGuest = {RoutePaths.root, RoutePaths.boardingZero};

  List<RouteBase> routes = [
    ...AuthRoutes.routes,
    ...MainRoutes.routes,
    ...DetailsRoutes.routes,
    ...SearchRoutes.routes,
    ...DiscoverRouting.routes,
    ...OnBoardingRoutes.routes,
  ];
}
