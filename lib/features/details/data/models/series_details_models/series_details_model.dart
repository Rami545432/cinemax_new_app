import 'package:cinemax_app_new/features/details/data/models/series_details_models/created_by.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_models/next_episode_to_air.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/external_ids.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/keywords.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_models/last_episode_to_air.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/network.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/data/models/series_details_models/season.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/translations.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/watch_providers.dart';
import 'package:cinemax_app_new/features/details/data/models/series_season_details/images.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/cast.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/credits.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_company.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/production_country.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/result.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/spoken_language.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/videos.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';

class SeriesDetailsModel extends SeriesDetailsEntity {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<dynamic>? episodeRunTime;
  String? firstAirDate;
  List<Genre>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<dynamic>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  NextEpisodeToAir? nextEpisodeToAir;
  List<Network>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<dynamic>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  List<Season>? seasons;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;
  Credits? credits;
  Videos? videos;
  Images? images;
  Keywords? keywords;
  WatchProviders? watchProviders;
  Translations? translations;
  ExternalIds? externalIds;
  Reviews? reviews;

  SeriesDetailsModel({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.credits,
    this.videos,
    this.images,
    this.keywords,
    this.watchProviders,
    this.translations,
    this.externalIds,
    this.reviews,
  }) : super(
         numOfEpisoide: numberOfEpisodes ?? 0,
         seiresId: id ?? 0,
         numOfSeason: numberOfSeasons ?? 0,
         season: seasons ?? [],
         rating: voteAverage ?? 0,
         actorDetails: credits?.cast ?? <Cast>[],
         videoKey: videos?.results ?? <Result>[],
         firstDate: firstAirDate ?? '_',
         geners: genres ?? [Genre(id: 27, name: 'Drama')],
         seriresTitle: name ?? '_',
         overView: overview ?? '_',
         tvBackDropPath: backdropPath ?? '',
         posterImage: posterPath ?? '',
         lastEpisodeAir: lastEpisodeToAir,
         companies: productionCompanies,
         countries: productionCountries,
         seriesStatus: status,
         kCredits: credits,
         kVideos: videos,
         kLanguages: originalLanguage ?? '_',
         kLastAirDate: lastAirDate,
         kExternalIds: externalIds,
         kReviews: reviews,
         kImages: images,
         kKeywords: keywords,
         kWatchProviders: watchProviders,
         kTranslations: translations,
         nextEpisodeAir: nextEpisodeToAir,
       );

  factory SeriesDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) => SeriesDetailsModel(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    createdBy: (json['created_by'] as List<dynamic>?)
        ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
        .toList(),
    episodeRunTime: json['episode_run_time'] as List<dynamic>?,
    firstAirDate: json['first_air_date'] as String?,
    genres: (json['genres'] as List<dynamic>?)
        ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String?,
    id: json['id'] as int?,
    inProduction: json['in_production'] as bool?,
    languages: json['languages'] as List<dynamic>?,
    lastAirDate: json['last_air_date'] as String?,
    lastEpisodeToAir: json['last_episode_to_air'] == null
        ? null
        : LastEpisodeToAir.fromJson(
            json['last_episode_to_air'] as Map<String, dynamic>,
          ),
    name: json['name'] as String?,
    nextEpisodeToAir: json['next_episode_to_air'] == null
        ? null
        : NextEpisodeToAir.fromJson(
            json['next_episode_to_air'] as Map<String, dynamic>,
          ),
    networks: (json['networks'] as List<dynamic>?)
        ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
        .toList(),
    numberOfEpisodes: json['number_of_episodes'] as int?,
    numberOfSeasons: json['number_of_seasons'] as int?,
    originCountry: json['origin_country'] as List<dynamic>?,
    originalLanguage: json['original_language'] as String?,
    originalName: json['original_name'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    productionCompanies: (json['production_companies'] as List<dynamic>?)
        ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
        .toList(),
    productionCountries: (json['production_countries'] as List<dynamic>?)
        ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
        .toList(),
    seasons: (json['seasons'] as List<dynamic>?)
        ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
        .toList(),
    spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
        ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    tagline: json['tagline'] as String?,
    type: json['type'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    credits: json['credits'] == null
        ? null
        : Credits.fromJson(json['credits'] as Map<String, dynamic>),
    videos: json['videos'] == null
        ? null
        : Videos.fromJson(json['videos'] as Map<String, dynamic>),
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
    translations: json['translations'] == null
        ? null
        : Translations.fromJson(json['translations'] as Map<String, dynamic>),
    externalIds: json['external_ids'] == null
        ? null
        : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
    reviews: json['reviews'] == null
        ? null
        : Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'created_by': createdBy?.map((e) => e.toJson()).toList(),
    'episode_run_time': episodeRunTime,
    'first_air_date': firstAirDate,
    'genres': genres?.map((e) => e.toJson()).toList(),
    'homepage': homepage,
    'id': id,
    'in_production': inProduction,
    'languages': languages,
    'last_air_date': lastAirDate,
    'last_episode_to_air': lastEpisodeToAir?.toJson(),
    'name': name,
    'next_episode_to_air': nextEpisodeToAir?.toJson(),
    'networks': networks?.map((e) => e.toJson()).toList(),
    'number_of_episodes': numberOfEpisodes,
    'number_of_seasons': numberOfSeasons,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_name': originalName,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'production_companies': productionCompanies
        ?.map((e) => e.toJson())
        .toList(),
    'production_countries': productionCountries
        ?.map((e) => e.toJson())
        .toList(),
    'seasons': seasons?.map((e) => e.toJson()).toList(),
    'spoken_languages': spokenLanguages?.map((e) => e.toJson()).toList(),
    'status': status,
    'tagline': tagline,
    'type': type,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'credits': credits?.toJson(),
    'videos': videos?.toJson(),
    'images': images?.toJson(),
    'keywords': keywords?.toJson(),
    'watch_providers': watchProviders?.toJson(),
    'translations': translations?.toJson(),
    'external_ids': externalIds?.toJson(),
    'reviews': reviews?.toJson(),
  };
}
