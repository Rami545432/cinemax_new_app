import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:equatable/equatable.dart';

/// Domain entity for a favorite item.
///
/// Clean — no sync fields. Sync is a data-layer concern.
class FavoriteEntity extends Equatable {
  // ── Content identification ──
  final int specificId;
  final ContentType contentType;

  // ── Display metadata ──
  final String title;
  final String posterImage;
  final String backdropImage;
  final List<int> genres;
  final String date;
  final double rating;

  // ── Series/episode specific ──
  final int seasonNumber;
  final int episodeNumber;
  final int tmbdId;

  // ── Owner ──
  final String userId;

  const FavoriteEntity({
    required this.specificId,
    required this.contentType,
    required this.title,
    required this.posterImage,
    required this.backdropImage,
    required this.genres,
    required this.date,
    required this.rating,
    this.seasonNumber = 0,
    this.episodeNumber = 0,
    this.tmbdId = 0,
    this.userId = 'guest',
  });

  FavoriteEntity copyWith({
    int? specificId,
    ContentType? contentType,
    String? title,
    String? posterImage,
    String? backdropImage,
    List<int>? genres,
    String? date,
    double? rating,
    int? seasonNumber,
    int? episodeNumber,
    int? tmbdId,
    String? userId,
  }) =>
      FavoriteEntity(
        specificId: specificId ?? this.specificId,
        contentType: contentType ?? this.contentType,
        title: title ?? this.title,
        posterImage: posterImage ?? this.posterImage,
        backdropImage: backdropImage ?? this.backdropImage,
        genres: genres ?? this.genres,
        date: date ?? this.date,
        rating: rating ?? this.rating,
        seasonNumber: seasonNumber ?? this.seasonNumber,
        episodeNumber: episodeNumber ?? this.episodeNumber,
        tmbdId: tmbdId ?? this.tmbdId,
        userId: userId ?? this.userId,
      );

  @override
  String toString() =>
      'FavoriteEntity(id: $specificId, type: $contentType, title: $title)';

  @override
  List<Object?> get props => [specificId, contentType, userId];
}
