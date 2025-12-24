import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/utils/bloc_provieders_views/favorite_bloc_provider.dart';
import 'package:cinemax_app_new/core/utils/navigation_views.dart';
import 'package:cinemax_app_new/features/Bot/presentation/views/chat_bot_view.dart';
import 'package:cinemax_app_new/features/discover/presentation/views/discover_view.dart';
import 'package:cinemax_app_new/features/favorite/presentation/views/favorite_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/home_view.dart';
import 'package:cinemax_app_new/features/onboarding/presentaion/view_models/widgets/page_view.dart';
import 'package:cinemax_app_new/features/profile/presentaion/views/profile_view.dart';
import 'package:cinemax_app_new/features/splash/presentaion/views_models/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainRoutes {
  static List<RouteBase> get routes => [
    GoRoute(
      path: RoutePaths.root,
      name: RouteName.root,
      builder: (context, state) =>
          const Center(child: CircularProgressIndicator()),
    ),
    GoRoute(
      path: RoutePaths.onBoarding,
      name: RouteName.onBoarding,
      builder: (context, state) => const OnBoardingTransistion(),
    ),

    GoRoute(
      path: RoutePaths.splash,
      name: RouteName.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutePaths.chatBot,
      name: RouteName.chatBot,
      builder: (context, state) => const ChatBotView(),
    ),
    ShellRoute(
      builder: (context, state, child) => NavigationViews(child: child),
      routes: [
        GoRoute(
          path: RoutePaths.home,
          name: RouteName.home,
          builder: (context, state) => const HomeView(),
        ),

        GoRoute(
          path: RoutePaths.favorite,
          name: RouteName.favorite,
          builder: (context, state) => const FavoriteView(),
        ),
        GoRoute(
          path: RoutePaths.discover,
          name: RouteName.discover,
          builder: (context, state) => const DiscoverView(),
        ),

        GoRoute(
          path: RoutePaths.profile,
          name: RouteName.profile,
          builder: (_, state) => const ProfileView(),
        ),
      ],
    ),
  ];
}
