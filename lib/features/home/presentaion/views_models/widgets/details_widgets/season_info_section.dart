import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../series/data/models/series_details_model/season.dart';
import 'episode_image.dart';
import 'season_and_episode.dart';

class SeasonInfoSection extends StatelessWidget {
  const SeasonInfoSection({
    super.key,
    required this.season,
    required this.defaultImageUrl,
  });

  final Season season;
  final String defaultImageUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: screenWidth > SizeConfig.mobile ? 1 : 2,
          child: EpisodeImage(
            episodeImageUrl: season.posterPath,
            imageUrl: defaultImageUrl,
          ),
        ),
        Expanded(flex: 3, child: SeasonAndEpisodeInfo(season: season)),
        Icon(Icons.arrow_forward_ios_rounded),
      ],
    );
  }
}
