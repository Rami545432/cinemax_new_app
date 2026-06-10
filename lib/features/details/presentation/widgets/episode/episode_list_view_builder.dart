import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/presentation/widgets/episode/episode_list_tile.dart';

class EpisodesListViewBuilder extends StatelessWidget {
  const EpisodesListViewBuilder({
    super.key,
    required this.data,
    required this.seiresPosterPath,
  });
  final String seiresPosterPath;
  final SeriesSeasonDetailsEntity data;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.separated(
      itemBuilder: (context, index) {
        if (data.seasonEpisodes[index].name == null) {
          return const Text("No Episodes Available");
        }

        return EpisodeListTile(
          episode: data.seasonEpisodes[index],
          seiresPosterPath: seiresPosterPath,
          seasonPosterPath: data.seasonPosterPath ?? seiresPosterPath,
          preloadedSeasonDetails: data,
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.seasonEpisodes.length,
    ),
  );
}
