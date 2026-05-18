// In a new file: extensions/base_card_model_extensions.dart
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

extension BaseCardModelExtensions on CardDisplayModel {
  DetailsNavigationData toNavigationData() {
    switch (contentType) {
      case ContentType.movies:
        return MovieNavData(
          tmdbId: id,
          title: title,
          date: date,
          rating: rating?.toDouble(),
          posterImage: posterPath,
          backdropImage: backdropPath,
          genres: genreIds,
          specificId: id,
        );
      case ContentType.series:
        return SeriesNavData(
          tmdbId: id,
          title: title,
          date: date,
          rating: rating?.toDouble(),
          posterImage: posterPath,
          backdropImage: backdropPath,
          genres: genreIds,
          specificId: id,
        );
      default:
        throw UnsupportedError(
          'ContentType $contentType not supported for cards',
        );
    }
  }
}
