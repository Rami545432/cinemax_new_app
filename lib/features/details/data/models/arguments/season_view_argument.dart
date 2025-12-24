import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';

class SeasonViewArgument {
  final int id;
  final int? seasonNumber;
  final String? backDropImageUrl;
  final String? posterImageUrl;
  final ContentType? contentType;
  final int? specificId;
  final String? seasonPosterPath;
  final String? seasonName;
  final double? seasonRating;
  final String? seasonDate;
  final SeriesSeasonDetailsEntitiy? preloadedSeasonDetails;

  SeasonViewArgument({
    required this.id,
    this.seasonNumber,
    this.backDropImageUrl,
    this.posterImageUrl,
    required this.contentType,
    this.specificId,
    this.seasonPosterPath,
    this.seasonName,
    this.seasonRating,
    this.seasonDate,
    this.preloadedSeasonDetails,
  });

  FavoriteEntity toFavoriteEntity() {
    return FavoriteEntity(
      id: id,
      title: seasonName ?? 'Season $seasonNumber',
      posterImage: seasonPosterPath ?? '',
      gener: [],
      contentType: ContentType.seasons,
      date: seasonDate ?? '',
      seasonNumber: seasonNumber ?? 0,
      specificId: specificId ?? 0,
      posterImageBackup: posterImageUrl ?? '',
      backGroundImage: backDropImageUrl ?? seasonPosterPath ?? '',
      episodeNumber: 0,
      rating: seasonRating ?? 0,
    );
  }
}
