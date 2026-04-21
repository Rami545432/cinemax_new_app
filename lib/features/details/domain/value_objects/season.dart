class Season {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  double? voteAverage;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    airDate: json['air_date'] as String?,
    episodeCount: json['episode_count'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    overview: json['overview'] as String?,
    posterPath: json['poster_path'] as String?,
    seasonNumber: json['season_number'] as int?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'air_date': airDate,
    'episode_count': episodeCount,
    'id': id,
    'name': name,
    'overview': overview,
    'poster_path': posterPath,
    'season_number': seasonNumber,
    'vote_average': voteAverage,
  };
}
