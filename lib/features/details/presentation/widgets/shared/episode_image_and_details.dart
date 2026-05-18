import 'package:flutter/material.dart';
import 'package:movify/features/details/presentation/models/episode_to_air_model.dart';
import 'package:movify/features/details/presentation/widgets/shared/episode_details.dart';
import 'package:movify/features/details/presentation/widgets/shared/episode_image.dart';

class EpisodeImageAndDetails extends StatelessWidget {
  const EpisodeImageAndDetails({
    super.key,
    required this.episodeToAirModel,
    required this.imageUrl,
  });

  final EpisodeToAirModel episodeToAirModel;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final image = episodeToAirModel.stillPath ?? imageUrl;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: EpisodeImage(episodeImageUrl: image)),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: EpisodeDetails(
            name: episodeToAirModel.name,
            episodeNumber: episodeToAirModel.episodeNumber,
            seasonNumber: episodeToAirModel.seasonNumber,
            airDate: episodeToAirModel.airDate,
          ),
        ),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
