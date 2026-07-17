import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';

/// Firestore serialization helpers for NewFavoriteModel
///
/// Handles conversion between Dart types and Firestore types:
/// - DateTime ↔ Timestamp
/// - Conditional field storage (omit nulls, zeros, redundant data)
/// - Safe parsing with defaults
extension FavoriteModelFirestoreX on FavoriteModel {
  // ========== TO FIRESTORE ==========

  /// Convert model to Firestore document
  ///
  /// Optimizations:
  /// - Omits null values
  /// - Omits default values (0s)
  /// - Omits redundant fields (userId - in path already)
  /// - Omits Hive-only fields (isSynced)
  /// - Conditional storage based on contentType
  /// - Converts DateTime → Timestamp
  Map<String, dynamic> toFirestore() {
    final data = <String, dynamic>{
      // ========== ALWAYS INCLUDE ==========
      'specificId': specificId,
      'contentType':
          contentType.name, // Store as string: "movie", "series", etc.
      'title': title,
      'posterImage': posterImage,
      'backdropImage': backdropImage,
      'date': date,
      'rating': rating,
    };

    // ========== CONDITIONAL: tmdbSeriesId ==========
    // Only for seasons and episodes (to link back to parent series)
    if (contentType == ContentType.seasons ||
        contentType == ContentType.episodes) {
      if (tmbdId != 0) {
        data['tmbdId'] = tmbdId;
      }
    }

    // ========== CONDITIONAL: genres ==========
    // Only for movies and series (not seasons/episodes)
    // Episodes inherit genres from their parent series
    if (contentType == ContentType.movies ||
        contentType == ContentType.series) {
      if (genres.isNotEmpty) {
        data['genres'] = genres;
      }
    }

    // ========== CONDITIONAL: seasonNumber ==========
    // Only for seasons and episodes
    if (contentType == ContentType.seasons ||
        contentType == ContentType.episodes) {
      if (seasonNumber != 0) {
        data['seasonNumber'] = seasonNumber;
      }
    }

    // ========== CONDITIONAL: episodeNumber ==========
    // Only for episodes
    if (contentType == ContentType.episodes) {
      if (episodeNumber != 0) {
        data['episodeNumber'] = episodeNumber;
      }
    }

    // ========== CONDITIONAL: lastSyncedAt ==========
    // Convert DateTime → Firestore Timestamp
    if (lastSyncedAt != null) {
      data['lastSyncedAt'] = Timestamp.fromDate(lastSyncedAt!);
    }

    // ========== NEVER INCLUDE ==========
    // userId: Redundant (already in document path: users/{userId}/favorites/...)
    // isSynced: Hive-only field (meaningless in Firestore - presence = synced)

    return data;
  }

  // ========== FROM FIRESTORE ==========

  /// Create model from Firestore DocumentSnapshot
  ///
  /// Features:
  /// - Safe parsing with defaults
  /// - Handles missing fields gracefully
  /// - Converts Firestore types to Dart types
  /// - Backwards compatible with old data
  static FavoriteModel fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    return FavoriteModel(
      // ========== REQUIRED FIELDS WITH SAFE FALLBACKS ==========
      specificId: data['specificId'] as int? ?? 0,

      contentType: _parseContentType(data['contentType']),

      title: data['title'] as String? ?? 'Unknown Title',

      posterImage: data['posterImage'] as String? ?? '',

      backdropImage: data['backdropImage'] as String? ?? '',

      // Parse genres list safely
      genres: _parseGenres(data['genres']),

      date: data['date'] as String? ?? '',

      // Handle both int and double from Firestore
      rating: (data['rating'] as num?)?.toDouble() ?? 0.0,

      // ========== OPTIONAL FIELDS WITH DEFAULTS ==========
      seasonNumber: data['seasonNumber'] as int? ?? 0,

      episodeNumber: data['episodeNumber'] as int? ?? 0,

      tmbdId: data['tmbdId'] as int? ?? 0,

      // isSynced: true when reading from Firestore (presence = synced)
      isSynced: true,

      // Convert Firestore Timestamp → DateTime
      lastSyncedAt: _parseTimestamp(data['lastSyncedAt']),
    );
  }

  // ========== HELPER METHODS ==========

  /// Parse ContentType enum from string
  /// Handles multiple formats for backwards compatibility
  static ContentType _parseContentType(dynamic value) {
    if (value == null) {
      return ContentType.movies;
    }

    final stringValue = value.toString().toLowerCase();

    // Try to match by name
    try {
      return ContentType.values.firstWhere(
        (type) => type.name.toLowerCase() == stringValue,
        orElse: () => ContentType.movies,
      );
    } catch (e) {
      return ContentType.movies;
    }
  }

  static List<int> _parseGenres(dynamic value) {
    if (value == null) {
      return [];
    }

    if (value is List) {
      try {
        // Filter and convert to int, skip invalid values
        return value
            .where((item) => item is int || item is num)
            .map((item) => (item as num).toInt())
            .toList();
      } catch (e) {
        return [];
      }
    }

    return [];
  }

  /// Parse Firestore Timestamp to DateTime
  /// Handles: Timestamp, String (ISO format), int (milliseconds), null
  static DateTime? _parseTimestamp(dynamic value) {
    if (value == null) {
      return null;
    }

    // Firestore Timestamp (most common)
    if (value is Timestamp) {
      return value.toDate();
    }

    // ISO String (backwards compatibility)
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return null;
      }
    }

    // Milliseconds since epoch (backwards compatibility)
    if (value is int) {
      try {
        return DateTime.fromMillisecondsSinceEpoch(value);
      } catch (e) {
        return null;
      }
    }

    return null;
  }
}
