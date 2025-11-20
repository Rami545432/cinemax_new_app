import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_episode_season_function.dart';
import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(formatDateDayMonthYear(airDate ?? 'Unknown'), style: style),
          ],
        ),
      ],
    );
  }
}
