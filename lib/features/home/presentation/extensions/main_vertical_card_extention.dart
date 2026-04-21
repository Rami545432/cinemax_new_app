// In a new file: extensions/base_card_model_extensions.dart
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/presentation/core/details_data_navigation.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';

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
