import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/episode.dart';
import 'package:movify/features/details/presentation/widgets/shared/actor_list_tile.dart';

class EpisodeActrolListTileListViewBuilder extends StatelessWidget {
  const EpisodeActrolListTileListViewBuilder({
    super.key,
    required this.episode,
  });
  final Episode episode;
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: episode.guestStars?.length ?? 0,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 2,
        child: ActorListTile(actorList: episode.guestStars![index]),
      ),
    ),
  );
}
