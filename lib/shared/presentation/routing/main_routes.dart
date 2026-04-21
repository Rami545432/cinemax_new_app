import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/Bot/presentation/views/chat_bot_view.dart';
import 'package:cinemax_app_new/features/discover/presentation/views/discover_view.dart';
import 'package:cinemax_app_new/features/favorite/presentation/views/favorite_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views/home_view.dart';
import 'package:cinemax_app_new/features/profile/presentation/views/profile_view.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/navigation_views.dart';
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
      path: RoutePaths.chatBot,
      name: RouteName.chatBot,
      builder: (context, state) => const ChatBotView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          NavigationViews(navigationShell: navigationShell),
      branches: [
        // Home Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              name: RouteName.home,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        // Discover Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.discover,
              name: RouteName.discover,
              builder: (context, state) => const DiscoverView(),
            ),
          ],
        ),
        // Favorite Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.favorite,
              name: RouteName.favorite,
              builder: (context, state) => const FavoriteView(),
            ),
          ],
        ),
        // Profile Branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.profile,
              name: RouteName.profile,
              builder: (_, state) => const ProfileView(),
            ),
          ],
        ),
      ],
    ),
  ];
}
