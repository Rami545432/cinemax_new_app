import 'package:cinemax_app_new/config/animations/widgets/animated_list_item.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:flutter/material.dart';

import 'episode_list_tile.dart';

class EpisodesListViewBuilder extends StatelessWidget {
  const EpisodesListViewBuilder({
    super.key,
    required this.data,
    required this.seiresPosterPath,
  });
  final String seiresPosterPath;
  final SeriesSeasonDetailsEntitiy data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        itemBuilder: (context, index) {
          if (data.seasonEpisodes[index].name == null) {
            return const Text("No Episodes Available");
          }

          return AnimatedListItem(
            index: index,
            child: EpisodeListTile(
              episode: data.seasonEpisodes[index],
              seiresPosterPath: seiresPosterPath,
              seasonPosterPath: data.seasonPosterPath ?? seiresPosterPath,
              preloadedSeasonDetails: data,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: data.seasonEpisodes.length,
      ),
    );
  }
}
