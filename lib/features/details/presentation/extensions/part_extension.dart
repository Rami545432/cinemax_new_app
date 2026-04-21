import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/domain/entites/part_entity.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';

extension PartEntityToDisplay on PartEntity {
  CardDisplayModel toCardDisplay() => CardDisplayModel(
    contentType: ContentType.movies,
    id: id??0,
    title: title??'',
    posterPath: posterPath??'',
    popularity: popularity,
    genreIds: genreIds,
    date: releaseDate,
    rating: voteAverage,
    backdropPath: backdropPath,
  );
}
