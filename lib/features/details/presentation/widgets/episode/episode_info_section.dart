import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/formatters/formatted_date_method.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/episode.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/icon_text_row.dart';
import 'package:flutter/material.dart';

class EpisodeInfoSection extends StatelessWidget {
  const EpisodeInfoSection({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) => Row(
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
