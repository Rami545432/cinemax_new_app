import 'package:cinemax_app_new/features/details/data/models/shared_details_models/external_ids.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keywords.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/translations.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/watch_providers.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/images.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';

import '../../data/models/shared_details_models/cast.dart';
import '../../data/models/shared_details_models/credits.dart';
import '../../data/models/shared_details_models/production_company.dart';
import '../../data/models/shared_details_models/production_country.dart';
import '../../data/models/shared_details_models/result.dart';
import '../../data/models/shared_details_models/videos.dart';
import '../../data/models/series_details_models/last_episode_to_air.dart';
import '../../data/models/series_details_models/next_episode_to_air.dart';
import '../../data/models/series_details_models/season.dart';

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
  final List<Genre>? geners;
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
  final WatchProviders? kWatchProviders;
  final Translations? kTranslations;
  final ExternalIds? kExternalIds;
  final Reviews? kReviews;
  final Images? kImages;
  final Keywords? kKeywords;

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
    this.kWatchProviders,
    this.kTranslations,
    this.kExternalIds,
    this.kReviews,
    this.kImages,
    this.kKeywords,
  });
}
