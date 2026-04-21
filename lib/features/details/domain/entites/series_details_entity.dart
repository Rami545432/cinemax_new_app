import 'package:cinemax_app_new/features/details/domain/value_objects/cast.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/credits.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/external_ids.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/genre.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/images.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/keywords.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/last_episode_to_air.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/next_episode_to_air.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/production_company.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/production_country.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/result.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/reviews.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/season.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/translations.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/videos.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/watch_providers.dart';

final class SeriesDetailsEntity {
  final int seiresId;
  final String? kLanguages;
  final String? seriesTitle;
  final String? firstDate;
  final num numOfEpisoide;
  final num numOfSeason;
  final List<Season> season;
  final double rating;
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
  final String? backgroundImage;
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
    required this.seriesTitle,
    required this.overView,
    required this.backgroundImage,
    this.kWatchProviders,
    this.kTranslations,
    this.kExternalIds,
    this.kReviews,
    this.kImages,
    this.kKeywords,
  });
}
