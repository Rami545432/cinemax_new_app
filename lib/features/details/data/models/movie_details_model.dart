import 'package:cinemax_app_new/features/details/data/models/shared_details_models/external_ids.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keywords.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/translations.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/watch_providers.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/images.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/belongs_to_collection.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/credits.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_company.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_country.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/spoken_language.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/videos.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? geners;
  String? homePage;
  int? id;
  String? imdbId;
  List<dynamic>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompany;
  List<ProductionCountry>? productionCountry;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAvarege;
  int? voteCount;
  Credits? credits;
  Videos? videos;
  Reviews? reviews;
  Images? images;
  Keywords? keywords;
  WatchProviders? watchProviders;
  ExternalIds? externalIds;
  Translations? translations;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.geners,
    this.homePage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompany,
    this.productionCountry,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAvarege,
    this.voteCount,
    this.credits,
    this.videos,
    this.reviews,
    this.images,
    this.keywords,
    this.watchProviders,
    this.externalIds,
    this.translations,
  }) : super(
         duration: runtime ?? 0,
         actorName: credits?.cast ?? [],
         movieStatus: status ?? '',
         companies: productionCompany,
         overView: overview ?? '',
         kGeners: geners ?? [],
         countries: productionCountry,
         kLanguages: originalLanguage,
         kCredits: credits,
         kBudget: budget ?? 0,
         kRevenue: revenue ?? 0,
         kVideos: videos,
         movieTitle: originalTitle ?? '',
         movieId: id ?? 0,
         kReviews: reviews,
         kImages: images,
         kKeywords: keywords,
         kWatchProviders: watchProviders,
         kExternalIds: externalIds,
         kTranslations: translations,
       );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>,
            ),
      budget: json['budget'] as int?,
      geners: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homePage: json['homepage'] as String?,
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      originCountry: json['origin_country'] as List<dynamic>?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompany: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountry: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAvarege: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      credits: json['credits'] == null
          ? null
          : Credits.fromJson(json['credits'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : Videos.fromJson(json['videos'] as Map<String, dynamic>),
      reviews: json['reviews'] == null
          ? null
          : Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      keywords: json['keywords'] == null
          ? null
          : Keywords.fromJson(json['keywords'] as Map<String, dynamic>),
      watchProviders: json['watch_providers'] == null
          ? null
          : WatchProviders.fromJson(
              json['watch_providers'] as Map<String, dynamic>,
            ),
      externalIds: json['external_ids'] == null
          ? null
          : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      translations: json['translations'] == null
          ? null
          : Translations.fromJson(json['translations'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'belongs_to_collection': belongsToCollection?.toJson(),
    'budget': budget,
    'genres': geners?.map((e) => e.toJson()).toList(),
    'homepage': homePage,
    'id': id,
    'imdb_id': imdbId,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'production_companies': productionCompany?.map((e) => e.toJson()).toList(),
    'production_countries': productionCountry?.map((e) => e.toJson()).toList(),
    'release_date': releaseDate,
    'revenue': revenue,
    'runtime': runtime,
    'spoken_languages': spokenLanguages?.map((e) => e.toJson()).toList(),
    'status': status,
    'tagline': tagline,
    'title': title,
    'video': video,
    'vote_average': voteAvarege,
    'vote_count': voteCount,
    'credits': credits?.toJson(),
    'videos': videos?.toJson(),
    'reviews': reviews?.toJson(),
    'images': images?.toJson(),
    'keywords': keywords?.toJson(),
    'watch_providers': watchProviders?.toJson(),
    'external_ids': externalIds?.toJson(),
    'translations': translations?.toJson(),
  };
}
