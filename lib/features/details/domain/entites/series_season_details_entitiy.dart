import 'package:movify/features/details/domain/value_objects/credits.dart';
import 'package:movify/features/details/domain/value_objects/episode.dart';
import 'package:movify/features/details/domain/value_objects/videos.dart';

final class SeriesSeasonDetailsEntity {
  final String seasonName;
  final String seasonOverView;
  final String seasonDate;
  final int seasonNum;
  final double seasonRating;
  final Videos? seasonVideos;
  final String? seasonPosterPath;
  final int seasonId;
  final Credits? seasonCredits;
  final List<Episode> seasonEpisodes;
  final int episodeId;
  final int tvId;

  SeriesSeasonDetailsEntity({
    required this.seasonName,
    required this.seasonOverView,
    required this.seasonDate,
    required this.seasonNum,
    required this.seasonRating,
    required this.seasonVideos,
    required this.seasonPosterPath,
    required this.seasonId,
    required this.seasonCredits,
    required this.seasonEpisodes,
    required this.episodeId,
    required this.tvId,
  });
}
