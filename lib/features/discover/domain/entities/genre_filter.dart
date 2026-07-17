import 'package:movify/features/discover/domain/enums/sort_by_enum.dart';

class GenreFilterParams {
  final int? genreId; // Movie or TV genre ID (same field)
  final SortBy? sortBy; // TMDB valid sorting options
  final int? minYear; // Filters release_year / first_air_date_year
  final int? maxYear; // Filters release_year / first_air_date_year
  final double? minRating; // vote_average.gte
  final double? maxRating; // vote_average.lte
  final int? minRuntime; // Runtime >= X
  final int? maxRuntime; // Runtime <= Y
  const GenreFilterParams({
    this.genreId,
    this.sortBy,
    this.minYear,
    this.maxYear,
    this.minRating,
    this.maxRating,
    this.minRuntime,
    this.maxRuntime,
  });

  GenreFilterParams copyWith({
    int? genreId,
    SortBy? sortBy,
    int? minYear,
    int? maxYear,
    double? minRating,
    double? maxRating,
    int? minRuntime,
    int? maxRuntime,
  }) => GenreFilterParams(
    genreId: genreId ?? this.genreId,
    sortBy: sortBy ?? this.sortBy,
    minYear: minYear ?? this.minYear,
    maxYear: maxYear ?? this.maxYear,
    minRating: minRating ?? this.minRating,
    maxRating: maxRating ?? this.maxRating,
    minRuntime: minRuntime ?? this.minRuntime,
    maxRuntime: maxRuntime ?? this.maxRuntime,
  );
}

enum GenreCategory { movies, tv }
