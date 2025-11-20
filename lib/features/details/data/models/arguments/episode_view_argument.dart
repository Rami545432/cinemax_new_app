import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';

class EpisodeViewArgument {
  final int seasonNumber;
  final int episodeNumber;
  final int tvid;
  final ContentType? contentType;
  final String seasonPosterPath;
  final String? seiresPosterPath;
  final SeriesSeasonDetailsEntitiy? preloadedSeasonDetails;

  EpisodeViewArgument({
    required this.seasonNumber,
    required this.episodeNumber,
    required this.tvid,
    required this.contentType,
    required this.seasonPosterPath,
    this.seiresPosterPath,
    this.preloadedSeasonDetails,
  });
}
