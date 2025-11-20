import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../data/models/series_details_models/season.dart';

class SeasonAndEpisodeInfo extends StatelessWidget {
  const SeasonAndEpisodeInfo({super.key, required this.season});

  final Season season;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    return Column(
      spacing: 10,
      children: [
        Text(season.name!, style: style),
        Text('Episodes: ${season.episodeCount}', style: style),
      ],
    );
  }
}
