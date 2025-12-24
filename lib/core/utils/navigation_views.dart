// Use your ORIGINAL NavigationViews (the one that worked!)
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NavigationViews extends HookWidget {
  const NavigationViews({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteName.chatBot);
        },

        child: const Icon(FontAwesomeIcons.robot, size: 22),
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.primary,

        onDestinationSelected: (value) {
          _onItemTapped(value, context);
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: [
          for (NavigationItems item in NavigationItems.values)
            NavigationDestination(
              selectedIcon: Icon(item.icon, color: item.selectedColor),
              icon: Icon(item.icon),
              label: item.label,
            ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(RoutePaths.home)) return 0;
    if (location.startsWith(RoutePaths.discover)) return 1;
    if (location.startsWith(RoutePaths.favorite)) return 2;
    if (location.startsWith(RoutePaths.profile)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
        break;
      case 1:
        context.go(RoutePaths.discover);
        break;
      case 2:
        context.go(RoutePaths.favorite);
        break;
      case 3:
        context.go(RoutePaths.profile);
        break;
    }
  }
}

enum NavigationItems { home, discover, favorite, profile }

extension NavigationItemsExtension on NavigationItems {
  String get label => switch (this) {
    NavigationItems.home => 'Home',
    NavigationItems.discover => 'Discover',
    NavigationItems.favorite => 'Favorite',
    NavigationItems.profile => 'Profile',
  };
  IconData get icon => switch (this) {
    NavigationItems.home => Icons.home,
    NavigationItems.discover => Icons.search,
    NavigationItems.favorite => Icons.favorite,
    NavigationItems.profile => Icons.person,
  };
  Color get selectedColor => switch (this) {
    NavigationItems.home => AppPrimaryColors.blueAccent,
    NavigationItems.discover => AppPrimaryColors.blueAccent,
    NavigationItems.favorite => Colors.redAccent,
    NavigationItems.profile => AppPrimaryColors.blueAccent,
  };
}
