import 'package:flutter/material.dart';
import 'package:cinemax_app_new/core/utils/helper/scroll_collapse_mixin.dart';
import 'package:cinemax_app_new/features/series/data/models/series_season_details/episode.dart';
import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/details_sliver_app_bar.dart';

import '../../../../core/utils/enums/content_type.dart';
import '../../../../core/utils/tablet_play_button.dart';
import '../../../home/presentaion/views_models/widgets/details_widgets/custom_tab_bar.dart';
import '../widgets/episode_info_section.dart';
import '../widgets/episode_tab_bar_body.dart';

class EpisodeBody extends StatefulWidget {
  const EpisodeBody({
    super.key,
    required this.episode,
    required this.imageUrl,
    required this.allEpisodes,
  });

  final Episode episode;
  final String imageUrl;
  final List<Episode> allEpisodes;

  @override
  State<EpisodeBody> createState() => _EpisodeBodyState();
}

class _EpisodeBodyState extends State<EpisodeBody>
    with ScrollCollapseMixin<EpisodeBody>, SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final int initialIndex;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    initialIndex = widget.allEpisodes.indexWhere(
      (episode) => episode.episodeNumber == widget.episode.episodeNumber,
    );
    _tabController = TabController(
      length: widget.allEpisodes.length,
      vsync: this,
      initialIndex: initialIndex,
    );
    _currentPage = initialIndex.toDouble();
    _tabController.animation?.addListener(_handleTabAnimation);
  }

  void _handleTabAnimation() {
    if (_tabController.animation != null) {
      setState(() {
        _currentPage = _tabController.animation!.value;
      });
    }
  }

  @override
  void dispose() {
    _tabController.animation?.removeListener(_handleTabAnimation);
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentPage.round();
    final currentEpisode = widget.allEpisodes[currentIndex];

    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        final imageUrl = currentEpisode.stillPath != null
            ? '${currentEpisode.stillPath}'
            : widget.imageUrl;
        return [
          DetailsSliverAppBar(
            imageUrl: imageUrl,
            isCollapsed: isCollapsed,
            id: currentEpisode.id ?? 0,

            contentType: ContentType.episodes,
            title:
                currentEpisode.name ??
                'Episode ${currentEpisode.episodeNumber}',
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
          CustomTabBar(
            controller: _tabController,
            tabs: List.generate(
              widget.allEpisodes.length,
              (index) => Tab(
                key: ValueKey(
                  'episode_${widget.allEpisodes[index].episodeNumber}',
                ),
                text:
                    'E${widget.allEpisodes[index].episodeNumber.toString().padLeft(2, '0')}',
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          widget.allEpisodes.length,
          (index) => EpisodeTabBarBody(
            key: ValueKey(
              'episode_body_${widget.allEpisodes[index].episodeNumber}',
            ),
            episode: widget.allEpisodes[index],
          ),
        ),
      ),
    );
  }
}
