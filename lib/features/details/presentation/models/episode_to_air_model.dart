final class EpisodeToAirModel {
  final int? id;
  final String? name;
  final String? overview;
  final double? voteAverage;
  final num? voteCount;
  final String? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final num? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;

  const EpisodeToAirModel({
    required this.id,
    required this.seasonNumber,
    required this.episodeNumber,
    required this.airDate,
    required this.voteAverage,
    this.name,
    this.overview,
    this.stillPath,
    required this.showId,
    this.voteCount,
    this.episodeType,
    this.productionCode,
    this.runtime,
  });
}
