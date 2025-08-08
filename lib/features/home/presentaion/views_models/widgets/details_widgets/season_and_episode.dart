import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../series/data/models/series_details_model/season.dart';

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
