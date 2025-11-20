enum SimilarCategory { movie, tv }

extension SimilarCategoryExtension on SimilarCategory {
  String get name => switch (this) {
    SimilarCategory.movie => 'movie',
    SimilarCategory.tv => 'tv',
  };
}
