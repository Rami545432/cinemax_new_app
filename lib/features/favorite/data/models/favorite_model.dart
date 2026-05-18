import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

/// Favorite Model - Data Layer
///
/// Represents a favorite item (movie, series, season, or episode)
/// Stores in both Hive (local) and Firestore (cloud)
@freezed
@HiveType(typeId: 4)
class FavoriteModel with _$FavoriteModel {
  const FavoriteModel._();
  const factory FavoriteModel({
    // ========== CONTENT IDENTIFICATION ==========

    /// TMDB ID for this specific content
    /// - For movies: Movie ID
    /// - For series: Series ID
    /// - For seasons: Season ID
    /// - For episodes: Episode ID
    @HiveField(1) required int specificId,

    /// Type of content (movie, series, season, episode)
    @HiveField(2) required ContentType contentType,

    // ========== DISPLAY METADATA ==========

    /// Display title
    @HiveField(3) required String title,

    /// Poster image URL (main thumbnail)
    @HiveField(4) required String posterImage,

    /// Backdrop image URL (background)
    @HiveField(5) required String backdropImage,

    /// Genre IDs (for movies and series only)
    /// Empty list for seasons and episodes
    @HiveField(6) required List<int> genres,

    /// Release/air date (ISO string format: "2024-02-17")
    @HiveField(7) required String date,

    /// Rating (0.0 - 10.0)
    @HiveField(8) required double rating,

    // ========== SERIES/EPISODE SPECIFIC ==========

    /// Season number (0 for movies/series, 1+ for seasons/episodes)
    @HiveField(9) @Default(0) int seasonNumber,

    /// Episode number (0 for movies/series/seasons, 1+ for episodes)
    @HiveField(10) @Default(0) int episodeNumber,

    /// Parent series TMDB ID (0 for movies/series, series ID for seasons/episodes)
    /// Used for API calls to get full series info

    // ========== SYNC MANAGEMENT ==========

    /// User ID ('guest' for unauthenticated, UID for authenticated)
    /// Used in Hive key generation for multi-user support
    @HiveField(11) @Default('guest') String userId,

    /// Sync status (false = pending upload, true = synced to cloud)
    /// Only used in Hive, not stored in Firestore
    @HiveField(12) @Default(false) bool isSynced,

    /// Last sync timestamp (when last uploaded/downloaded from cloud)
    /// Stored as DateTime in Hive, Timestamp in Firestore
    @HiveField(13) DateTime? lastSyncedAt,
    @HiveField(14) @Default(0) int tmbdId,
  }) = _FavoriteModel;

  // ========== FACTORY CONSTRUCTORS ==========

  /// Create from JSON (Freezed generated, for Hive)
  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  /// Create from Entity (Domain → Data)
  factory FavoriteModel.fromEntity(FavoriteEntity entity) => FavoriteModel(
    specificId: entity.specificId,
    contentType: entity.contentType,
    title: entity.title,
    posterImage: entity.posterImage,
    backdropImage: entity.backdropImage,
    genres: entity.genres,
    date: entity.date,
    rating: entity.rating,
    seasonNumber: entity.seasonNumber,
    episodeNumber: entity.episodeNumber,
    tmbdId: entity.tmbdId,
    userId: entity.userId,
  );

  // ========== INSTANCE METHODS ==========

  /// Convert to Entity (Data → Domain)
  FavoriteEntity toEntity() => FavoriteEntity(
    specificId: specificId,
    contentType: contentType,
    title: title,
    posterImage: posterImage,
    backdropImage: backdropImage,
    genres: genres,
    date: date,
    rating: rating,
    seasonNumber: seasonNumber,
    episodeNumber: episodeNumber,
    tmbdId: tmbdId,
    userId: userId,
  );
  String get firestoreDocId => '${specificId}_${contentType.name}';
}
