import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/arguments/episode_view_argument.dart';
import '../../../data/models/series_season_details/episode.dart';

class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({
    super.key,
    required this.episode,
    required this.seiresPosterPath,
    required this.seasonPosterPath,
    this.preloadedSeasonDetails,
  });

  final Episode episode;
  final String seiresPosterPath;
  final String seasonPosterPath;
  final SeriesSeasonDetailsEntitiy? preloadedSeasonDetails;
  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle18(context);
    String date = formatDateMonthYear(episode.airDate ?? "Unknown");
    return ListTile(
      leading: Text(episode.episodeNumber.toString(), style: style),
      title: Text(
        episode.name ?? "Season ${episode.seasonNumber}",
        style: style,
      ),
      subtitle: Text(
        '$date ${episode.runtime ?? 'Unknown'} mins',
        style: AppStyles.textStyle14(context),
      ),
      onTap: () {
        context.pushNamed(
          RouteName.episode,
          extra: EpisodeViewArgument(
            contentType: ContentType.episodes,
            episodeNumber: episode.episodeNumber!,
            seasonNumber: episode.seasonNumber!,
            tvid: episode.showId!,
            seasonPosterPath: seasonPosterPath,
            seiresPosterPath: seiresPosterPath,
            preloadedSeasonDetails: preloadedSeasonDetails,
          ),
        );
      },
    );
  }
}
