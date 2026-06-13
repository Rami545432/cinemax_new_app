import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/features/details/domain/value_objects/episode.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/core/mappers/favorite_mappers.dart';
import 'package:movify/features/details/presentation/widgets/episode/episode_info_section.dart';
import 'package:movify/features/details/presentation/widgets/episode/episode_tab_bar_body.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:movify/features/home/presentation/widgets/opcaity_details_image.dart';
import 'package:movify/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:movify/hooks/ui/use_tab_controller_animation.dart';
import 'package:movify/shared/presentation/widgets/keep_alive_wrapper.dart';
import 'package:movify/shared/presentation/widgets/tablet_play_button.dart';

class EpisodeBody extends HookWidget {
  const EpisodeBody({
    super.key,
    required this.episodeNumber,
    required this.seasonPosterPath,
    required this.seriesBackUpImage,
    required this.allEpisodes,
  });

  final int episodeNumber;
  final String seasonPosterPath;
  final String seriesBackUpImage;
  final List<Episode> allEpisodes;

  @override
  Widget build(BuildContext context) {
    final scrollCollapse = useScrollCollapseDebounced(200);
    final intialIndex = allEpisodes.indexWhere(
      (element) => element.episodeNumber == episodeNumber,
    );
    final tabControllerResult = useTabControllerAnimation(
      length: allEpisodes.length,
      initialIndex: intialIndex,
      vsync: useSingleTickerProvider(),
    );
    final currentIndex = tabControllerResult.currentPage.round();
    final currentEpisode = allEpisodes[currentIndex];
    final tabs = useMemoized(
      () => List.generate(
        allEpisodes.length,
        (index) => Tab(
          key: ValueKey('episode_${allEpisodes[index].episodeNumber}'),
          text:
              'E${allEpisodes[index].episodeNumber.toString().padLeft(2, '0')}',
        ),
      ),
      [allEpisodes.length],
    );
    final tabsViewChildren = useMemoized(
      () => List.generate(
        allEpisodes.length,
        (index) => KeepAliveWrapper(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EpisodeTabBarBody(
              key: ValueKey('episode_body_${allEpisodes[index].episodeNumber}'),
              episode: allEpisodes[index],
            ),
          ),
        ),
      ),
      [allEpisodes.length],
    );

    final expandedHeight = MediaQuery.heightOf(context) * 0.3;

    final headerSlivers = useMemoized(
      () => [
        DetailsSliverAppBar(
          expandedHeight: expandedHeight,
          isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
          title: currentEpisode.name ?? 'Episode $episodeNumber',
          favorite: FavoriteMapper.fromNavigationData(
            EpisodeNavData(
              tmdbId: currentEpisode.showId ?? 0,
              posterImage: seasonPosterPath,
              backdropImage: currentEpisode.stillPath,
              seasonNumber: currentEpisode.seasonNumber ?? 0,
              seriesPosterPath: seriesBackUpImage,
              episodeNumber: currentEpisode.episodeNumber ?? 0,
              rating: currentEpisode.voteAverage,
              specificId: currentEpisode.id ?? 0,
              date: currentEpisode.airDate,
            ),
          ),
          backgroundWidget: OpcaityDetailsImage(
            detailsBackGroundImage: currentEpisode.stillPath,
            defaultDetailsBackGroundImage: seasonPosterPath,
            imageSize: TmdbImageSize.w500,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: EpisodeInfoSection(
              key: ValueKey(currentEpisode.episodeNumber),
              episode: currentEpisode,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: TabletPlayButton(
            type: 'tv',
            id: currentEpisode.showId.toString(),
            seasonNumber: currentEpisode.seasonNumber ?? 0,
            episodeNumber: currentEpisode.episodeNumber ?? 0,
            title:
                currentEpisode.name ??
                'Episode ${currentEpisode.episodeNumber}',
          ),
        ),
        CustomTabBar(controller: tabControllerResult.controller, tabs: tabs),
      ],
      [
        currentEpisode,
        scrollCollapse.isCollapsedNotifier,
        expandedHeight,
        tabControllerResult.controller,
        tabs,
      ],
    );

    return NestedScrollView(
      controller: scrollCollapse.scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => headerSlivers,
      body: TabBarView(
        controller: tabControllerResult.controller,
        children: tabsViewChildren,
      ),
    );
  }
}
