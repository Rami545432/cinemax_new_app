import '../../features/home/domian/entites/movie_details_entity.dart';
import 'belongs_to_collection.dart';

import 'credits.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';
import 'videos.dart';

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
  }) : super(
         duration: runtime ?? 0,
         actorName: credits?.cast ?? [],
         movieStatus: status ?? '',
         companies: productionCompany,
         countries: productionCountry,
         kLanguages: originalLanguage,
         kCredits: credits,
         kBudget: budget ?? 0,
         kRevenue: revenue ?? 0,
         kVideos: videos,
         movieTitle: originalTitle ?? '',
         overView: overview ?? '',
         genres: geners?.map((e) => e.id ?? 0).toList() ?? [],
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
  };
}
