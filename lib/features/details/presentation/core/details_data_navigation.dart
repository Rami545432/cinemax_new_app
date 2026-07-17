import 'package:movify/core/utils/enums/content_type.dart';

sealed class DetailsNavigationData {
  final int tmdbId;
  final ContentType contentType;
  final String posterImage;
  final String? backdropImage;
  final int specificId;

  const DetailsNavigationData({
    required this.tmdbId,
    required this.contentType,
    required this.posterImage,
    this.backdropImage,
    required this.specificId,
  });
}

class MovieNavData extends DetailsNavigationData {
  final String title;
  final String? date;
  final double? rating;
  final List<int>? genres;

  const MovieNavData({
    required super.tmdbId,
    required this.title,
    this.date,
    this.rating,
    required super.posterImage,
    super.backdropImage,
    this.genres,
    required super.specificId,
  }) : super(contentType: ContentType.movies);
}

class SeriesNavData extends DetailsNavigationData {
  final String title;
  final String? date;
  final double? rating;
  final List<int>? genres;

  const SeriesNavData({
    required super.tmdbId,
    required this.title,
    this.date,
    this.rating,
    required super.posterImage,
    super.backdropImage,
    this.genres,
    required super.specificId,
  }) : super(contentType: ContentType.series);
}

class SeasonNavData extends DetailsNavigationData {
  final int seasonNumber;
  final String? seasonName;
  final double? rating;
  final String? date;

  const SeasonNavData({
    required super.tmdbId,
    required this.seasonNumber,
    this.seasonName,
    this.rating,
    this.date,
    required super.posterImage,
    super.backdropImage,
    required super.specificId,
  }) : super(contentType: ContentType.seasons);
}

class EpisodeNavData extends DetailsNavigationData {
  final int seasonNumber;
  final int episodeNumber;
  final String? date;
  final double? rating;
  final String? seriesPosterPath;

  const EpisodeNavData({
    required super.tmdbId,
    required this.seasonNumber,
    required this.episodeNumber,
    this.date,
    this.rating,
    this.seriesPosterPath,
    required super.posterImage,
    super.backdropImage,
    required super.specificId,
  }) : super(contentType: ContentType.episodes);
}
