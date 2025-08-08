import '../../../../models/movie_details_model/credits.dart';
import '../../../../models/movie_details_model/videos.dart';
import '../../data/models/series_season_details/episode.dart';

class SeriesSeasonDetailsEntitiy {
  final String seasonName;
  final String seasonOverView;
  final String seasonDate;
  final num seasonNum;
  final num seasonRating;
  final Videos? seasonVideos;
  final String seasonPosterPath;
  final num seasonId;
  final Credits? seasonCredits;
  final List<Episode> seasonEpisodes;

  SeriesSeasonDetailsEntitiy({
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
  });
}
