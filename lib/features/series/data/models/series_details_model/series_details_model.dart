import '../../../../../models/movie_details_model/cast.dart';
import '../../../../../models/movie_details_model/credits.dart';
import '../../../../../models/movie_details_model/genre.dart';
import '../../../../../models/movie_details_model/production_company.dart';
import '../../../../../models/movie_details_model/production_country.dart';
import '../../../../../models/movie_details_model/result.dart';
import '../../../../../models/movie_details_model/spoken_language.dart';
import '../../../../../models/movie_details_model/videos.dart';
import '../../../domain/entites/series_entity_details.dart';
import 'created_by.dart';

import 'last_episode_to_air.dart';
import 'network.dart';
import 'next_episode_to_air.dart';

import 'season.dart';

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
  num? numberOfEpisodes;
  num? numberOfSeasons;
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
  num? voteCount;
  Credits? credits;
  Videos? videos;

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
  }) : super(
         kLanguages: originalLanguage ?? '_',
         tvBackDropPath: backdropPath ?? '',
         posterImage: posterPath ?? '',
         lastEpisodeAir: lastEpisodeToAir,
         companies: productionCompanies,
         countries: productionCountries,
         seriesStatus: status,
         kLastAirDate: lastAirDate,
         kVideos: videos,
         kCredits: credits,
         actorDetails: credits?.cast ?? <Cast>[],
         videoKey: videos?.results ?? <Result>[],
         season: seasons ?? [],
         firstDate: firstAirDate ?? '_',
         geners:
             genres?.where((e) => e.id != null).map((e) => e.id!).toList() ??
             [],
         numOfEpisoide: numberOfEpisodes ?? 0,
         numOfSeason: numberOfSeasons ?? 0,
         seiresId: id ?? 0,
         seriresTitle: name ?? '_',
         nextEpisodeAir: nextEpisodeToAir,
         rating: voteAverage ?? 0,
         overView: overview ?? '_',
       );

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsModel(
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
      numberOfEpisodes: json['number_of_episodes'] as num?,
      numberOfSeasons: json['number_of_seasons'] as num?,
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
    );
  }

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
  };
}
