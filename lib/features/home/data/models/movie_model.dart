import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';

class MovieModel extends MovieEntity {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
         movieId: id ?? 0,
         movieTitle: title ?? '',
         gener: genreIds ?? [],
         movieRating: voteAverage ?? 0,
         date: releaseDate ?? '',
         moviePosterImage: posterPath ?? '',
         horizentalImage: backdropPath ?? '',
         storyLine: overview ?? '',
         moviePopularity: popularity ?? 0,
       );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)
            ?.map((gener) => gener as int)
            .toList() ??
        [],
    id: json['id'] as int?,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as double?),
    posterPath: json['poster_path'] as String?,
    releaseDate: json['release_date'] as String?,
    title: json['title'] as String?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}
