import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/helper/formatted_date_method.dart';

class EpisodeDetails extends StatelessWidget {
  const EpisodeDetails({
    super.key,
    required this.name,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.airDate,
  });

  final String? name;
  final num? episodeNumber;
  final num? seasonNumber;
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
              episodeNumber! > 0 || seasonNumber! > 0
                  ? 'S${seasonNumber.toString().padLeft(2, '0')} E${episodeNumber.toString().padLeft(2, '0')}'
                  : 'S$seasonNumber E$episodeNumber',
              style: style,
            ),
            Text(formatDateDayMonthYear(airDate ?? 'Unknown'), style: style),
          ],
        ),
      ],
    );
  }
}
