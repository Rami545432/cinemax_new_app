import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/features/details/domain/enums/tabs_enums.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/core/mappers/favorite_mappers.dart';
import 'package:movify/features/details/presentation/widgets/season/season_tabs_bloc_builder.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:movify/features/details/presentation/widgets/shared/stacked_details_background.dart';

class SeasonViewBody extends HookWidget {
  const SeasonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SeasonNavData>();
    final List<Tab> seasonTabs = SeasonDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final expandedHeight = MediaQuery.heightOf(context) * 0.7;
    final collapseThreshold = expandedHeight - kToolbarHeight;
    final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));

    final sliverAppBar = useMemoized(
      () => DetailsSliverAppBar(
        expandedHeight: expandedHeight,
        title: model.seasonName ?? 'Season ${model.seasonNumber}',
        isCollapsedNotifier: isCollapsedNotifier,
        favorite: FavoriteMapper.fromNavigationData(model),
        backgroundWidget: StackedDetailsBackGorund(
          backGroundImage: model.posterImage,
          posterImage: model.posterImage,
          title: model.seasonName ?? '_',
          date: model.date ?? '_',
          rating: model.rating ?? 0,
          heroTag: '${model.tmdbId}',
          imageSize: TmdbImageSize.w500,
        ),
      ),
      [model, isCollapsedNotifier, expandedHeight],
    );

    return DefaultTabController(
      length: seasonTabs.length,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Check if we're scrolling the outer scroll view
          if (scrollNotification.depth == 0) {
            final offset = scrollNotification.metrics.pixels;
            final shouldCollapse = offset >= collapseThreshold;

            if (isCollapsedNotifier.value != shouldCollapse) {
              isCollapsedNotifier.value = shouldCollapse;
            }
          }
          return false;
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            sliverAppBar,
            CustomTabBar(tabs: seasonTabs),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: SeasonTabsBlocBuilder(seiresPosterPath: model.posterImage),
          ),
        ),
      ),
    );
  }
}
