import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/season.dart';
import 'package:movify/l10n/app_localizations.dart';

class SeasonAndEpisodeInfo extends StatelessWidget {
  const SeasonAndEpisodeInfo({super.key, required this.season});

  final Season season;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    final l10n = AppLocalizations.of(context)!;
    return Column(
      spacing: 10,
      children: [
        Text(season.name!, style: style),
        Text('${l10n.episodes}: ${season.episodeCount}', style: style),
      ],
    );
  }
}
