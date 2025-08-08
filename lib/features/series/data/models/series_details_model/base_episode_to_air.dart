abstract class BaseEpisodeToAir {
  num? get id;
  String? get name;
  String? get overview;
  num? get voteAverage;
  num? get voteCount;
  String? get airDate;
  num? get episodeNumber;
  String? get episodeType;
  String? get productionCode;
  num? get runtime;
  num? get seasonNumber;
  num? get showId;
  String? get stillPath;

  Map<String, dynamic> toJson();
}
