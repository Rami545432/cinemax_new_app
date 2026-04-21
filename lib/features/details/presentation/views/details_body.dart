import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/domain/enums/tabs_enums.dart';
import 'package:cinemax_app_new/features/details/presentation/core/details_data_navigation.dart';
import 'package:cinemax_app_new/features/details/presentation/core/mappers/favorite_mappers.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/build_details_body_content.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/stacked_details_background.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/time_bloc_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

    // Create a ValueNotifier to track collapse state
    final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));

    // Calculate the collapse threshold based on the expanded height
    final collapseThreshold =
        MediaQuery.sizeOf(context).height * 0.7 - kToolbarHeight;

    return DefaultTabController(
      length: tabs.length,
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
          headerSliverBuilder: (_, _) => [
            DetailsSliverAppBar(
              favorite: FavoriteMapper.fromNavigationData(navigationData),
              title: title,
              isCollapsedNotifier: isCollapsedNotifier,
              expandedHeight: MediaQuery.sizeOf(context).height * 0.7,
              backgroundWidget: StackedDetailsBackGorund(
                backGroundImage: navigationData.backdropImage,
                posterImage: navigationData.posterImage,
                title: title,
                date: date,
                rating: rating,
                heroTag: heroTag,
                timeBlocSelector: const TimeBlocSelector(),
              ),
            ),
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
