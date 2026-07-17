import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/domain/value_objects/episode.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';

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
  final SeriesSeasonDetailsEntity? preloadedSeasonDetails;
  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle18(context);
    final String date = FormattedDateMethods.formatDateMonthYear(
      episode.airDate ?? "Unknown",
    );
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
          extra: EpisodeNavData(
            tmdbId: episode.showId ?? 0,
            seasonNumber: episode.seasonNumber ?? 0,
            episodeNumber: episode.episodeNumber ?? 0,
            posterImage: seasonPosterPath,
            backdropImage: episode.stillPath,
            seriesPosterPath: seiresPosterPath,
            specificId: episode.id ?? 0,
            rating: episode.voteAverage,
          ),
        );
      },
    );
  }
}
