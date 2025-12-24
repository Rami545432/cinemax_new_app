import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailsSuccess extends HookWidget {
  const DetailsSuccess({
    super.key,
    required this.favorite,
    required this.tabs,
    required this.body,
    this.heroTag,
    required this.title,
    this.backgroundWidget,
  });

  final FavoriteEntity favorite;
  final List<Tab> tabs;
  final Widget body;
  final String? heroTag;
  final String title;
  final Widget? backgroundWidget;

  @override
  Widget build(BuildContext context) {
    final scrollCollapse = useScrollCollapseDebounced(150);
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        controller: scrollCollapse.scrollController,
        headerSliverBuilder: (_, _) => [
          DetailsSliverAppBar(
            favorite: favorite,
            title: title,
            isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
            backgroundWidget: backgroundWidget,
          ),
          CustomTabBar(tabs: tabs),
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: body,
        ),
      ),
    );
  }
}
