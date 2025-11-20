enum SeriesCategory { trending, popular, topRated, airingToday }

extension SeriesCategoryExtension on SeriesCategory {
  String get name => switch (this) {
    SeriesCategory.trending => 'Trending',
    SeriesCategory.popular => 'POPULAR',
    SeriesCategory.topRated => 'TOP RATED',
    SeriesCategory.airingToday => 'AIRING TODAY',
  };
}
