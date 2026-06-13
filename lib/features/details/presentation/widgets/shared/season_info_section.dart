import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/season.dart';
import 'package:movify/features/details/presentation/widgets/shared/episode_image.dart';
import 'package:movify/features/details/presentation/widgets/shared/season_and_episode.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

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
    final double screenWidth = MediaQuery.widthOf(context);
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
        const Icon(Icons.arrow_forward_ios_rounded),
      ],
    );
  }
}
