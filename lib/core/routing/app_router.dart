import 'dart:developer';
import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:cinemax_app_new/features/auth/routing/auth_routes.dart';
import 'package:cinemax_app_new/features/discover/routing/discover_routing.dart';
import 'package:cinemax_app_new/features/main/presentation/routes/main_routes.dart';
import 'package:cinemax_app_new/features/search/routing/search_routes.dart';
import 'package:cinemax_app_new/features/details/routing/details_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  GoRouter createRouter() {
    final authCubit = getIt.get<AuthCubit>();

    return GoRouter(
      routes: routes,
      redirect: (context, state) =>
          _redirect(authCubit.state, state.matchedLocation),
      refreshListenable: authCubit,
      initialLocation: RoutePaths.root,
      debugLogDiagnostics: true,
    );
  }

  String? _redirect(AuthState authState, String currentPath) {
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
      final authScreens = [RoutePaths.root, RoutePaths.onBoarding];

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

  List<RouteBase> routes = [
    ...AuthRoutes.routes,
    ...MainRoutes.routes,
    ...DetailsRoutes.routes,
    ...SearchRoutes.routes,
    ...DiscoverRouting.routes,
  ];
}
