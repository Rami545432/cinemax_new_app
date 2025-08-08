import 'package:flutter/material.dart';

import '../../../home/presentaion/views_models/widgets/details_widgets/actor_list_tile.dart';
import '../../data/models/series_season_details/episode.dart';

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
          child: ActorListTile(
            actorList: episode.guestStars![index],
          ),
        );
      },
    );
  }
}
