// domain/entities/movie_entity.dart

final class MovieEntity {
  final int id;
  final String title;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double popularity;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.popularity,
  });

  // Business logic methods (if needed)
  // bool isPopular() => popularity > 100;

  // bool isHighlyRated() => voteAverage >= 7.0;

  // bool isRecent() {
  //   final release = DateTime.tryParse(releaseDate);
  //   if (release == null) return false;
  //   final now = DateTime.now();
  //   return now.difference(release).inDays < 365;
  // }

  // Immutable copy for state management
  MovieEntity copyWith({
    int? id,
    String? title,
    List<int>? genreIds,
    double? voteAverage,
    String? releaseDate,
    String? posterPath,
    String? backdropPath,
    String? overview,
    double? popularity,
  }) => MovieEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    genreIds: genreIds ?? this.genreIds,
    voteAverage: voteAverage ?? this.voteAverage,
    releaseDate: releaseDate ?? this.releaseDate,
    posterPath: posterPath ?? this.posterPath,
    backdropPath: backdropPath ?? this.backdropPath,
    overview: overview ?? this.overview,
    popularity: popularity ?? this.popularity,
  );
}
