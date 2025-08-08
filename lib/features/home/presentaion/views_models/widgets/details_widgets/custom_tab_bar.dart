import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabs, this.controller});

  final List<Tab> tabs;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle18(context);

    return SliverPersistentHeader(
      delegate: _SliverHeaderDelegate(
        TabBar(
          isScrollable: tabs.length > 5,
          controller: controller,
          labelColor: AppPrimaryColors.blueAccent,
          indicatorColor: AppPrimaryColors.blueAccent,
          labelStyle: style,
          unselectedLabelStyle: style,
          tabs: tabs,
          tabAlignment: tabs.length > 5 ? null : TabAlignment.fill,
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SliverHeaderDelegate(this.tabBar);
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      elevation: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
