import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/series/domain/entites/series_season_details_entitiy.dart';
import 'package:flutter/material.dart';

import 'episode_list_tile.dart';

class EpisodesListViewBuilder extends StatelessWidget {
  const EpisodesListViewBuilder({super.key, required this.data});
  final SeriesSeasonDetailsEntitiy data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (data.seasonEpisodes[index].name == null) {
          return const Text("No Episodes Available");
        }
        final style = AppStyles.textStyle18(context);
        return EpisodeListTile(
          style: style,
          data: data.seasonEpisodes[index],
          imageUrl: data.seasonPosterPath,
          allEpisodes: data.seasonEpisodes,
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: data.seasonEpisodes.length,
    );
  }
}
