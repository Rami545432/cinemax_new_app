import 'package:cinemax_app_new/core/utils/keep_alive_wrapper.dart';
import 'package:cinemax_app_new/core/utils/tablet_play_button.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/episode/episode_info_section.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/episode/episode_tab_bar_body.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/opcaity_details_image.dart';
import 'package:cinemax_app_new/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:cinemax_app_new/hooks/ui/use_tab_controller_animation.dart';
import 'package:flutter/material.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/episode.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/details_sliver_app_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

    return NestedScrollView(
      controller: scrollCollapse.scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          DetailsSliverAppBar(
            isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
            title: currentEpisode.name ?? 'Episode $episodeNumber',
            favorite: currentEpisode.toFavoriteEntity(
              seasonPosterPath: seasonPosterPath,
              seriesBackUpImage: seriesBackUpImage,
            ),
            backgroundWidget: OpcaityDetailsImage(
              detailsBackGroundImage: currentEpisode.stillPath,
              defaultDetailsBackGroundImage: seasonPosterPath,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
        ];
      },
      body: TabBarView(
        controller: tabControllerResult.controller,
        children: tabsViewChildren,
      ),
    );
  }
}
