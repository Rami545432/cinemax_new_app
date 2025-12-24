import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/images.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/belongs_to_collection.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/cast.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/credits.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/external_ids.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keywords.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_company.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_country.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/translations.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/videos.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/watch_providers.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';

class MovieDetailsEntity {
  final int movieId;
  final int? kRevenue;
  final String? posterImage;
  final String? backgroundImage;

  final int? kBudget;

  final int duration;

  final List<Cast> actorName;

  final String movieStatus;

  final List<ProductionCompany>? companies;

  final List<ProductionCountry>? countries;

  final String? kLanguages;

  final Credits? kCredits;

  final Videos? kVideos;

  final String movieTitle;

  final List<Genre> kGeners;
  final String? date;
  final double? rating;

  final String overView;
  final Reviews? kReviews;
  final Images? kImages;
  final Keywords? kKeywords;
  final WatchProviders? kWatchProviders;
  final ExternalIds? kExternalIds;
  final Translations? kTranslations;
  final BelongsToCollection? kBelongsToCollection;

  MovieDetailsEntity({
    required this.movieId,
    required this.duration,
    required this.actorName,
    required this.movieStatus,
    this.companies,
    this.kRevenue,
    this.kBudget,
    this.kLanguages,
    this.countries,
    this.kCredits,
    required this.kGeners,
    required this.overView,
    this.kVideos,
    required this.movieTitle,
    required this.kReviews,
    this.kImages,
    this.kKeywords,
    this.kWatchProviders,
    this.kExternalIds,
    this.kTranslations,
    this.kBelongsToCollection,
    this.date,
    this.rating,
    this.backgroundImage,
    this.posterImage,
  });

  FavoriteEntity toFavoriteEntity() {
    return FavoriteEntity(
      id: movieId,
      title: movieTitle,
      posterImage: posterImage ?? '',
      gener: kGeners.map((g) => g.name ?? '').toList(),
      contentType: ContentType.movies,
      date: date ?? '',
      seasonNumber: 0,
      specificId: movieId,
      posterImageBackup: posterImage ?? '',
      backGroundImage: backgroundImage ?? posterImage ?? '',
      episodeNumber: 0,
      rating: rating ?? 0,
    );
  }
}
