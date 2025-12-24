class GenreFilterParams {
  final int? genreId; // Movie or TV genre ID (same field)
  final SortBy? sortBy; // TMDB valid sorting options
  final int? minYear; // Filters release_year / first_air_date_year
  final int? maxYear; // Filters release_year / first_air_date_year
  final double? minRating; // vote_average.gte
  final double? maxRating; // vote_average.lte
  final String? withKeywords; // comma-separated keyword IDs
  final String? withoutKeywords; // comma-separated keyword IDs
  final String? withNetworks; // TV networks (for TV-only filtering)
  final String? withCompanies; // Movie production companies
  final String? withProviders; // Streaming provider IDs
  final int? minRuntime; // Runtime >= X
  final int? maxRuntime; // Runtime <= Y
  final int? page; // Page number
  const GenreFilterParams({
    this.genreId,
    this.sortBy,
    this.minYear,
    this.maxYear,
    this.minRating,
    this.maxRating,
    this.withKeywords,
    this.withoutKeywords,
    this.withNetworks,
    this.withCompanies,
    this.withProviders,
    this.minRuntime,
    this.maxRuntime,
    this.page,
  });

  GenreFilterParams copyWith({
    int? genreId,
    SortBy? sortBy,
    int? minYear,
    int? maxYear,
    double? minRating,
    double? maxRating,
    String? withKeywords,
    String? withoutKeywords,
    String? withNetworks,
    String? withCompanies,
    String? withProviders,
    int? minRuntime,
    int? maxRuntime,
    int? page,
  }) {
    return GenreFilterParams(
      genreId: genreId ?? this.genreId,
      sortBy: sortBy ?? this.sortBy,
      minYear: minYear ?? this.minYear,
      maxYear: maxYear ?? this.maxYear,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      withKeywords: withKeywords ?? this.withKeywords,
      withoutKeywords: withoutKeywords ?? this.withoutKeywords,
      withNetworks: withNetworks ?? this.withNetworks,
      withCompanies: withCompanies ?? this.withCompanies,
      withProviders: withProviders ?? this.withProviders,
      minRuntime: minRuntime ?? this.minRuntime,
      maxRuntime: maxRuntime ?? this.maxRuntime,
      page: page ?? this.page,
    );
  }
}

enum SortBy {
  popularityDesc,
  popularityAsc,
  ratingDesc,
  ratingAsc,
  releaseDateDesc,
  releaseDateAsc,
  firstAirDateDesc,
  firstAirDateAsc,

  revenueDesc,
  revenueAsc,
  voteCountDesc,
  voteCountAsc,
}

extension SortByExtension on SortBy {
  String get name => switch (this) {
    SortBy.popularityDesc => 'popularity.desc',
    SortBy.popularityAsc => 'popularity.asc',
    SortBy.ratingDesc => 'vote_average.desc',
    SortBy.ratingAsc => 'vote_average.asc',
    SortBy.releaseDateDesc => 'release_date.desc',
    SortBy.releaseDateAsc => 'release_date.asc',
    SortBy.firstAirDateDesc => 'first_air_date.desc',
    SortBy.firstAirDateAsc => 'first_air_date.asc',
    SortBy.revenueDesc => 'revenue.desc',
    SortBy.revenueAsc => 'revenue.asc',
    SortBy.voteCountDesc => 'vote_count.desc',
    SortBy.voteCountAsc => 'vote_count.asc',
  };
}

extension SortByUiExtension on SortBy {
  String get uiLabel => switch (this) {
    SortBy.popularityDesc => 'Most popular',
    SortBy.popularityAsc => 'Least popular',
    SortBy.ratingDesc => 'Highest rated',
    SortBy.ratingAsc => 'Lowest rated',
    SortBy.releaseDateDesc => 'Newest releases',
    SortBy.releaseDateAsc => 'Oldest releases',
    SortBy.revenueDesc => 'Highest revenue',
    SortBy.revenueAsc => 'Lowest revenue',
    SortBy.firstAirDateDesc => 'Newest first air date',
    SortBy.firstAirDateAsc => 'Oldest first air date',
    SortBy.voteCountDesc => 'Most votes',
    SortBy.voteCountAsc => 'Least votes',
  };
}

enum GenreCategory { movies, tv }
