abstract class BaseEpisodeToAir {
  num? get id;
  String? get name;
  String? get overview;
  num? get voteAverage;
  num? get voteCount;
  String? get airDate;
  int? get episodeNumber;
  String? get episodeType;
  String? get productionCode;
  num? get runtime;
  int? get seasonNumber;
  int? get showId;
  String? get stillPath;

  Map<String, dynamic> toJson();
}
