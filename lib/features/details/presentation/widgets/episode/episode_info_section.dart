import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/episode.dart';
import 'package:flutter/material.dart';

import '../../../../search/presentaion/view_models/widgets/icon_text_row.dart';

class EpisodeInfoSection extends StatelessWidget {
  const EpisodeInfoSection({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Episode ${episode.episodeNumber}',
          style: AppStyles.textStyle16(context),
        ),
        IconTextRow(
          iconData: Icons.calendar_month,
          text: FormattedDateMethods.formatDateDayMonthYear(
            episode.airDate ?? 'Unknown',
          ),
        ),
        if (episode.voteAverage != null)
          Text(
            '⭐ ${episode.voteAverage!.toStringAsFixed(1)}',
            style: AppStyles.textStyle14(context),
          ),
      ],
    );
  }
}
