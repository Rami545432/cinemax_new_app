import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../data/models/series_details_models/season.dart';
import 'episode_image.dart';
import 'season_and_episode.dart';

class SeasonInfoSection extends StatelessWidget {
  const SeasonInfoSection({
    super.key,
    required this.season,
    required this.defaultImageUrl,
    required this.heroTag,
  });

  final Season season;
  final String defaultImageUrl;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    final image = season.posterPath ?? defaultImageUrl;
    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: screenWidth > SizeConfig.mobile ? 1 : 2,
          child: Hero(
            tag: heroTag,
            child: EpisodeImage(episodeImageUrl: image),
          ),
        ),
        Expanded(flex: 3, child: SeasonAndEpisodeInfo(season: season)),
        Icon(Icons.arrow_forward_ios_rounded),
      ],
    );
  }
}
