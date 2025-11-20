import 'base_episode_to_air.dart';

class LastEpisodeToAir implements BaseEpisodeToAir {
  @override
  final num? id;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  final num? voteAverage;
  @override
  final num? voteCount;
  @override
  final String? airDate;
  @override
  final int? episodeNumber;
  @override
  final String? episodeType;
  @override
  final String? productionCode;
  @override
  final int? runtime;
  @override
  final int? seasonNumber;
  @override
  final int? showId;
  @override
  final String? stillPath;

  const LastEpisodeToAir({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return LastEpisodeToAir(
      id: json['id'] as num?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
      airDate: json['air_date'] as String?,
      episodeNumber: json['episode_number'] as int?,
      episodeType: json['episode_type'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: json['runtime'] as int?,
      seasonNumber: json['season_number'] as int?,
      showId: json['show_id'] as int?,
      stillPath: json['still_path'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'overview': overview,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'air_date': airDate,
    'episode_number': episodeNumber,
    'episode_type': episodeType,
    'production_code': productionCode,
    'runtime': runtime,
    'season_number': seasonNumber,
    'show_id': showId,
    'still_path': stillPath,
  };
}
