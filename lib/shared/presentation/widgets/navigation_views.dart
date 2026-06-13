// Use your ORIGINAL NavigationViews (the one that worked!)
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/l10n/app_localizations.dart';

class NavigationViews extends HookWidget {
  const NavigationViews({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: navigationShell.currentIndex == 0,
    onPopInvokedWithResult: (didPop, result) async {
      if (!didPop) {
        _onItemTapped(0, context);
      }
    },
    child: Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.primary,

        onDestinationSelected: (value) {
          _onItemTapped(value, context);
        },
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          ...NavigationItems.values.map(
            (item) => NavigationDestination(
              selectedIcon: Icon(item.icon, color: item.selectedColor),
              icon: Icon(item.icon),
              label: item.localizedLabel(context),
            ),
          ),
        ],
      ),
    ),
  );

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

enum NavigationItems { home, discover, favorite, profile }

extension NavigationItemsExtension on NavigationItems {
  String localizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      NavigationItems.home => l10n.home,
      NavigationItems.discover => l10n.discover,
      NavigationItems.favorite => l10n.favorites,
      NavigationItems.profile => l10n.profile,
    };
  }

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
