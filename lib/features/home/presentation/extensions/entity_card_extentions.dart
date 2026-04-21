// home/presentation/extensions/entity_card_extensions.dart
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';

extension MovieEntityToDisplay on MovieEntity {
  CardDisplayModel toCardDisplay() => CardDisplayModel(
    id: id,
    title: title,
    posterPath: posterPath,
    backdropPath: backdropPath,
    rating: voteAverage,
    genreIds: genreIds,
    date: releaseDate,
    popularity: popularity,
    contentType: ContentType.movies,
  );
}

extension SeriesEntityToDisplay on SeriesEntity {
  CardDisplayModel toCardDisplay() => CardDisplayModel(
    id: id,
    title: name,
    posterPath: posterPath,
    backdropPath: backdropPath,
    rating: voteAverage,
    genreIds: genreIds,
    date: firstAirDate,
    popularity: popularity,
    contentType: ContentType.series,
  );
}

extension ListMovieEntityToDisplay on List<MovieEntity> {
  List<CardDisplayModel> toCardModels() =>
      map((e) => e.toCardDisplay()).toList();
}

extension ListSeriesEntityToDisplay on List<SeriesEntity> {
  List<CardDisplayModel> toCardModels() =>
      map((e) => e.toCardDisplay()).toList();
}

// PartEntity, ContentEntity, SearchHistory — same pattern
