enum MovieCategory { trending, popular, topRated, upcoming, nowPlaying }

extension MovieCategoryExtension on MovieCategory {
  String get name => switch (this) {
    MovieCategory.trending => 'Trending',
    MovieCategory.popular => 'POPULAR',
    MovieCategory.topRated => 'TOP RATED',
    MovieCategory.upcoming => 'UPCOMING',
    MovieCategory.nowPlaying => 'NOW PLAYING',
  };
}
