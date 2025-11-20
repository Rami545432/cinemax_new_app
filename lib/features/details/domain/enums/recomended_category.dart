enum RecomendedCategory { movie, tv }

extension RecomendedCategoryExtension on RecomendedCategory {
  String get name => switch (this) {
    RecomendedCategory.movie => 'movie',
    RecomendedCategory.tv => 'tv',
  };
}
