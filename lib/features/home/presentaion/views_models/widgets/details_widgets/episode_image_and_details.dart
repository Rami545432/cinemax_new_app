import 'package:flutter/material.dart';

import '../../../../../series/data/models/series_details_model/next_episode_to_air.dart';
import '../../../../../series/domain/entites/series_entity_details.dart';
import 'episode_details.dart';
import 'episode_image.dart';

class EpisodeImageAndDetails extends StatelessWidget {
  const EpisodeImageAndDetails({
    super.key,
    required this.nextEpisode,
    required this.seriesDetailsEntity,
  });

  final NextEpisodeToAir nextEpisode;
  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EpisodeImage(
          episodeImageUrl: nextEpisode.stillPath,
          imageUrl: seriesDetailsEntity.tvBackDropPath,
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: EpisodeDetails(
            name: nextEpisode.name,
            episodeNumber: nextEpisode.episodeNumber,
            seasonNumber: nextEpisode.seasonNumber,
            airDate: nextEpisode.airDate,
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
