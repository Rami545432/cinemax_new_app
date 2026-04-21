import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/season.dart';
import 'package:flutter/material.dart';

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
