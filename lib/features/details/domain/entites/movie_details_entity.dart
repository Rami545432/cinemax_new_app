import 'package:movify/features/details/domain/value_objects/belongs_to_collection.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';
import 'package:movify/features/details/domain/value_objects/credits.dart';
import 'package:movify/features/details/domain/value_objects/external_ids.dart';
import 'package:movify/features/details/domain/value_objects/genre.dart';
import 'package:movify/features/details/domain/value_objects/images.dart';
import 'package:movify/features/details/domain/value_objects/keywords.dart';
import 'package:movify/features/details/domain/value_objects/production_company.dart';
import 'package:movify/features/details/domain/value_objects/production_country.dart';
import 'package:movify/features/details/domain/value_objects/reviews.dart';
import 'package:movify/features/details/domain/value_objects/translations.dart';
import 'package:movify/features/details/domain/value_objects/videos.dart';
import 'package:movify/features/details/domain/value_objects/watch_providers.dart';

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
}
