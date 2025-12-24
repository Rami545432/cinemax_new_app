import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabs, this.controller});

  final List<Tab> tabs;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverHeaderDelegate(tabs, controller),
      pinned: true,
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<Tab> tabs;
  final TabController? controller;
  _SliverHeaderDelegate(this.tabs, this.controller);
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      elevation: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final style = AppStyles.textStyle18(context);

          final shouldBeScrollable = tabs.length > 3;
          final tabAlignment = shouldBeScrollable
              ? TabAlignment.start
              : TabAlignment.fill;

          return TabBar(
            overlayColor: WidgetStateProperty.all(Colors.blueGrey[200]!),

            isScrollable: shouldBeScrollable,
            tabAlignment: tabAlignment,
            controller: controller,
            labelColor: AppPrimaryColors.blueAccent,
            indicatorColor: AppPrimaryColors.blueAccent,
            dividerColor: Colors.transparent,
            labelStyle: style,
            unselectedLabelStyle: style,
            tabs: tabs,
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
