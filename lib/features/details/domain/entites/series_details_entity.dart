import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/external_ids.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keywords.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/translations.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/watch_providers.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/images.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';

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

  FavoriteEntity toFavoriteEntity() {
    return FavoriteEntity(
      id: seiresId,
      title: seriesTitle ?? '',
      posterImage: posterImage ?? '',
      gener: geners?.map((g) => g.name ?? '').toList() ?? [],
      contentType: ContentType.series,
      date: firstDate ?? '',
      seasonNumber: 0,
      specificId: seiresId,
      posterImageBackup: posterImage ?? '',
      backGroundImage: backgroundImage ?? posterImage ?? '',
      episodeNumber: 0,
      rating: rating,
    );
  }
}
