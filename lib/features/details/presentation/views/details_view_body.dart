import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/domain/enums/tabs_enums.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/core/mappers/favorite_mappers.dart';
import 'package:movify/features/details/presentation/widgets/shared/build_details_body_content.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_notifiacation_listener.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:movify/features/details/presentation/widgets/shared/stacked_details_background.dart';
import 'package:movify/features/details/presentation/widgets/shared/time_bloc_selector.dart';

class DetailsBody extends HookWidget {
  const DetailsBody({
    super.key,
    required this.navigationData, // MovieNavData or SeriesNavData
    this.heroTag,
  });

  final DetailsNavigationData navigationData; // Can only be Movie or Series
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    // Simple extraction - only 2 types to handle
    final (
      title,
      date,
      rating,
      contentType,
      specificId,
    ) = switch (navigationData) {
      MovieNavData data => (
        data.title,
        data.date ?? '',
        data.rating ?? 0.0,
        ContentType.movies,
        data.specificId,
      ),
      SeriesNavData data => (
        data.title,
        data.date ?? '',
        data.rating ?? 0.0,
        ContentType.series,
        data.specificId,
      ),
      _ => throw UnimplementedError('Invalid navigation data for DetailsBody'),
    };

    final movieTabs = MovieDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final seriesTabs = SeriesDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final tabs = contentType == ContentType.movies ? movieTabs : seriesTabs;

    final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));
    // Calculate the collapse threshold based on the expanded height
    final expandedHeight = MediaQuery.heightOf(context) * 0.7;
    final collapseThreshold = expandedHeight - kToolbarHeight;
    final exactCacheWidth =
        (MediaQuery.widthOf(context) * MediaQuery.devicePixelRatioOf(context))
            .round();

    // Cache the sliver app bar so NestedScrollView's headerSliverBuilder
    // doesn't recreate the heavy background widget on every scroll frame.
    final sliverAppBar = useMemoized(
      () => DetailsSliverAppBar(
        favorite: FavoriteMapper.fromNavigationData(navigationData),
        title: title,
        isCollapsedNotifier: isCollapsedNotifier,
        expandedHeight: expandedHeight,
        backgroundWidget: StackedDetailsBackGorund(
          backGroundImage: navigationData.backdropImage,
          posterImage: navigationData.posterImage,
          title: title,
          date: date,
          rating: rating,
          heroTag: heroTag,
          timeBlocSelector: const TimeBlocSelector(),
          memCacheWidth: exactCacheWidth,
        ),
      ),
      [navigationData, isCollapsedNotifier, expandedHeight, exactCacheWidth],
    );

    return DefaultTabController(
      length: tabs.length,
      child: CustomNotificationListener(
        collapseThreshold: collapseThreshold,
        isCollapsedNotifier: isCollapsedNotifier,
        child: NestedScrollView(
          headerSliverBuilder: (_, _) => [
            sliverAppBar,
            CustomTabBar(tabs: tabs),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BuildDetailsBodyContent(
              id: navigationData.tmdbId,
              contentType: contentType,
            ),
          ),
        ),
      ),
    );
  }
}
