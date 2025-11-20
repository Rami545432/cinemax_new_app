import 'package:flutter/material.dart';

import '../../../data/models/series_details_models/base_episode_to_air.dart';
import 'episode_details.dart';
import 'episode_image.dart';

class EpisodeImageAndDetails extends StatelessWidget {
  const EpisodeImageAndDetails({
    super.key,
    required this.baseEpisodeToAir,
    required this.imageUrl,
  });

  final BaseEpisodeToAir baseEpisodeToAir;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final image = baseEpisodeToAir.stillPath ?? imageUrl;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: EpisodeImage(episodeImageUrl: image)),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: EpisodeDetails(
            name: baseEpisodeToAir.name,
            episodeNumber: baseEpisodeToAir.episodeNumber,
            seasonNumber: baseEpisodeToAir.seasonNumber,
            airDate: baseEpisodeToAir.airDate,
          ),
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
