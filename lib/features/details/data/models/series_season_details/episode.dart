import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';

import '../shared_details_models/cast.dart';

class Episode {
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  num? voteAverage;
  num? voteCount;
  List<dynamic>? crew;
  List<Cast>? guestStars;

  Episode({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    airDate: json['air_date'] as String?,
    episodeNumber: json['episode_number'] as int?,
    episodeType: json['episode_type'] as String?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    overview: json['overview'] as String?,
    productionCode: json['production_code'] as String?,
    runtime: json['runtime'] as int?,
    seasonNumber: json['season_number'] as int?,
    showId: json['show_id'] as int?,
    stillPath: json['still_path'] as String?,
    voteAverage: json['vote_average'] as num?,
    voteCount: json['vote_count'] as num?,
    crew: json['crew'] as List<dynamic>?,
    guestStars: (json['guest_stars'] as List<dynamic>?)
        ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'air_date': airDate,
    'episode_number': episodeNumber,
    'episode_type': episodeType,
    'id': id,
    'name': name,
    'overview': overview,
    'production_code': productionCode,
    'runtime': runtime,
    'season_number': seasonNumber,
    'show_id': showId,
    'still_path': stillPath,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'crew': crew,
    'guest_stars': guestStars?.map((e) => e.toJson()).toList(),
  };

  FavoriteEntity toFavoriteEntity({
    required String seasonPosterPath,
    required String seriesBackUpImage,
  }) {
    return FavoriteEntity(
      id: showId ?? 0,
      title: name ?? 'Episode $episodeNumber',
      posterImage: seasonPosterPath,
      gener: [],
      contentType: ContentType.episodes,
      date: airDate ?? '',
      seasonNumber: seasonNumber ?? 0,
      specificId: id ?? 0,
      posterImageBackup: seriesBackUpImage,
      backGroundImage: stillPath ?? seriesBackUpImage,
      episodeNumber: episodeNumber ?? 0,
      rating: voteAverage ?? 0,
    );
  }
}
