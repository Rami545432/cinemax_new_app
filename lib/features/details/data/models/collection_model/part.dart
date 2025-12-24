import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

class Parts implements BaseCardModel {
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

  factory Parts.fromJson(Map<String, dynamic> json) {
    return Parts(
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
  }
  @override
  int get cardId => id ?? 0;
  @override
  String get cardImage => posterPath ?? '';
  @override
  String get cardTitle => title ?? '';
  @override
  String? get horizontalCardImage => backdropPath;
  @override
  String? get type => mediaType;
  @override
  num? get cardRating => voteAverage;
  @override
  num? get cardPopularity => popularity;
  @override
  List<int>? get cardGeners => genreIds;
  @override
  String? get cardDate => releaseDate;
  @override
  ContentType? get contentType => ContentType.movies;
}
