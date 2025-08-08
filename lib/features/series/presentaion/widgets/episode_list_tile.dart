import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/helper/formatted_date_method.dart';
import '../../data/models/series_season_details/episode.dart';
import '../views/episode_view.dart';

class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({
    super.key,
    required this.style,
    required this.data,
    required this.imageUrl,
    required this.allEpisodes,
  });

  final TextStyle style;
  final Episode data;
  final String imageUrl;
  final List<Episode> allEpisodes;

  @override
  Widget build(BuildContext context) {
    String date = formatDateMonthYear(data.airDate ?? "Unknown");
    return ListTile(
      leading: Text(data.episodeNumber.toString(), style: style),
      title: Text(data.name ?? "Season ${data.seasonNumber}", style: style),
      subtitle: Text(
        '$date ${data.runtime ?? 'Unknown'} mins',
        style: AppStyles.textStyle14(context),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodeView(
              episode: data,
              imageUrl: imageUrl,
              allEpisodes: allEpisodes,
            ),
          ),
        );
      },
    );
  }
}
