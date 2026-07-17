// data/models/movie_model.dart

import 'package:movify/shared/domain/entites/movie_entity.dart';

class MovieModel {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

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
  });

  // From JSON (API Response)
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    genreIds: (json['genre_ids'] as List<dynamic>?)
        ?.map((genre) => genre as int)
        .toList(),
    id: json['id'] as int?,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    releaseDate: json['release_date'] as String?,
    title: json['title'] as String?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );

  // To JSON (API Request)
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

  // Convert Model to Entity (DTO → Domain)
  MovieEntity toEntity() => MovieEntity(
    id: id ?? 0,
    title: title ?? '',
    genreIds: genreIds ?? [28],
    voteAverage: voteAverage ?? 0,
    releaseDate: releaseDate ?? '',
    posterPath: posterPath ?? '',
    backdropPath: backdropPath ?? '',
    overview: overview ?? '',
    popularity: popularity ?? 0,
  );
}
