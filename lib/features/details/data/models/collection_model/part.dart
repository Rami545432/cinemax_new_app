import 'package:cinemax_app_new/features/details/domain/entites/part_entity.dart';

class Parts {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originaltitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Parts({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originaltitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Parts.fromJson(Map<String, dynamic> json) => Parts(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    originaltitle: json['original_title'] as String?,
    overview: json['overview'] as String?,
    posterPath: json['poster_path'] as String?,
    mediaType: json['media_type'] as String?,
    originalLanguage: json['original_language'] as String?,
    genreIds: (json['genre_ids'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    popularity: json['popularity'] as double?,
    releaseDate: json['release_date'] as String?,
    video: json['video'] as bool?,
    voteAverage: json['vote_average'] as double?,
    voteCount: json['vote_count'] as int?,
  );

  PartEntity toEntity() => PartEntity(
    adult: adult,
    backdropPath: backdropPath,
    id: id,
    title: title,
    originalTitle: originaltitle,
    overview: overview,
    posterPath: posterPath,
    mediaType: mediaType,
    originalLanguage: originalLanguage,
    genreIds: genreIds,
    popularity: popularity,
    releaseDate: releaseDate,
    video: video,
    voteAverage: voteAverage,
    voteCount: voteCount,
  );
}
