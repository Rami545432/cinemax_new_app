import '../../../../models/movie_details_model/cast.dart';
import '../../../../models/movie_details_model/credits.dart';
import '../../../../models/movie_details_model/production_company.dart';
import '../../../../models/movie_details_model/production_country.dart';
import '../../../../models/movie_details_model/result.dart';
import '../../../../models/movie_details_model/videos.dart';
import '../../data/models/series_details_model/last_episode_to_air.dart';
import '../../data/models/series_details_model/next_episode_to_air.dart';
import '../../data/models/series_details_model/season.dart';

class SeriesDetailsEntity {
  final int seiresId;
  final String? kLanguages;
  final String? seriresTitle;
  final String? firstDate;
  final num numOfEpisoide;
  final num numOfSeason;
  final List<Season> season;
  final num rating;
  final List<Cast>? actorDetails;
  final List<int>? geners;
  final List<Result>? videoKey;
  final LastEpisodeToAir? lastEpisodeAir;
  final NextEpisodeToAir? nextEpisodeAir;
  final List<ProductionCompany>? companies;
  final List<ProductionCountry>? countries;
  final String? seriesStatus;
  final String? kLastAirDate;
  final Credits? kCredits;
  final Videos? kVideos;
  final String? tvBackDropPath;
  final String? posterImage;
  final String? overView;

  SeriesDetailsEntity({
    this.kLanguages,
    required this.numOfEpisoide,
    required this.seiresId,
    required this.numOfSeason,
    required this.season,
    required this.rating,
    required this.actorDetails,
    required this.videoKey,
    required this.firstDate,
    required this.geners,
    this.lastEpisodeAir,
    this.nextEpisodeAir,
    this.companies,
    this.kLastAirDate,
    this.countries,
    this.seriesStatus,
    this.kCredits,
    this.kVideos,
    this.posterImage,
    required this.seriresTitle,
    required this.overView,
    required this.tvBackDropPath,
  });
}
