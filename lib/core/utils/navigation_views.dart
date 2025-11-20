// Use your ORIGINAL NavigationViews (the one that worked!)
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class NavigationViews extends HookWidget {
  const NavigationViews({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.primary,

        onDestinationSelected: (value) {
          _onItemTapped(value, context);
        },
        selectedIndex: _calculateSelectedIndex(context),
        destinations: [
          for (int i = 0; i < selectedIcons.length; i++)
            NavigationDestination(
              selectedIcon: selectedIcons[i],
              icon: icons[i],
              label: naviLables[i],
            ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(RoutePaths.home)) return 0;
    if (location.startsWith(RoutePaths.favorite)) return 1;
    if (location.startsWith(RoutePaths.series)) return 2;
    if (location.startsWith(RoutePaths.profile)) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(RoutePaths.home);
        break;
      case 1:
        context.go(RoutePaths.favorite);
        break;
      case 2:
        context.go(RoutePaths.series);
        break;
      case 3:
        context.go(RoutePaths.profile);
        break;
    }
  }
}
