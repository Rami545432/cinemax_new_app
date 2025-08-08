import '../../domain/entites/series_entity.dart';

class SeriesModel extends SeriesEntity {
  String? backdropPath;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<dynamic>? originCountry;

  SeriesModel({
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  }) : super(
         tvId: id ?? 0,
         tvTitle: name ?? '',
         tvPosterPath: posterPath ?? '',
         tvBackDropPath: backdropPath ?? '',
         tvFirstAirDate: firstAirDate ?? '',
         tvRating: voteAverage ?? 0,
         gener: genreIds ?? [],
         storyLine: overview ?? '',
         tvPopularity: popularity ?? 0,
       );

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
    backdropPath: json['backdrop_path'] as String?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    originalName: json['original_name'] as String?,
    overview: json['overview'] as String?,
    posterPath: json['poster_path'] as String?,
    mediaType: json['media_type'] as String?,
    adult: json['adult'] as bool?,
    originalLanguage: json['original_language'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)
            ?.map((gener) => gener as int)
            .toList() ??
        [],
    popularity: (json['popularity'] as num?)?.toDouble(),
    firstAirDate: json['first_air_date'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
    originCountry: json['origin_country'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'backdrop_path': backdropPath,
    'id': id,
    'name': name,
    'original_name': originalName,
    'overview': overview,
    'poster_path': posterPath,
    'media_type': mediaType,
    'adult': adult,
    'original_language': originalLanguage,
    'genre_ids': genreIds,
    'popularity': popularity,
    'first_air_date': firstAirDate,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'origin_country': originCountry,
  };
}
