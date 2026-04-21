final class SeriesEntity {
  final int id;
  final String name;
  final List<int> genreIds;
  final double voteAverage;
  final String firstAirDate;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double popularity;

  const SeriesEntity({
    required this.id,
    required this.name,
    required this.genreIds,
    required this.voteAverage,
    required this.firstAirDate,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.popularity,
  });
  SeriesEntity copyWith({
    int? id,
    String? name,
    List<int>? genreIds,
    double? voteAverage,
    String? firstAirDate,
    String? posterPath,
    String? backdropPath,
    String? overview,
    double? popularity,
  }) => SeriesEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    genreIds: genreIds ?? this.genreIds,
    voteAverage: voteAverage ?? this.voteAverage,
    firstAirDate: firstAirDate ?? this.firstAirDate,
    posterPath: posterPath ?? this.posterPath,
    backdropPath: backdropPath ?? this.backdropPath,
    overview: overview ?? this.overview,
    popularity: popularity ?? this.popularity,
  );
}
