import 'package:cinemax_app_new/features/details/presentation/widgets/shared/actor_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../data/models/series_season_details/episode.dart';

class EpisodeActrolListTileListViewBuilder extends StatelessWidget {
  const EpisodeActrolListTileListViewBuilder({
    super.key,
    required this.episode,
  });
  final Episode episode;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episode.guestStars?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 0.5,
          child: ActorListTile(actorList: episode.guestStars![index]),
        );
      },
    );
  }
}
