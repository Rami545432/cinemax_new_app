import 'package:flutter/material.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/formatters/formatted_episode_season_function.dart';
import 'package:movify/core/utils/app_styles.dart';

class EpisodeDetails extends StatelessWidget {
  const EpisodeDetails({
    super.key,
    required this.name,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.airDate,
  });

  final String? name;
  final int? episodeNumber;
  final int? seasonNumber;
  final String? airDate;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context);
    return Column(
      spacing: 10,
      children: [
        Text(
          name ?? 'Unknown Episode',
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text(
              formattedEpisodeSeason(episodeNumber, seasonNumber),
              style: style,
            ),
            Text(
              FormattedDateMethods.formatDateDayMonthYear(airDate ?? 'Unknown'),
              style: style,
            ),
          ],
        ),
      ],
    );
  }
}
