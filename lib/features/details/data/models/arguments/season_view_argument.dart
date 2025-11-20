import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';

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
}
