import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/data/models/favorite_model.dart';

/// Local data source for favorites (Hive).
///
/// Simplified — no sync-status tracking, no metadata.
abstract class LocalFavoriteDataSource {
  /// Get favorites, optionally filtered by userId and contentType.
  Future<List<FavoriteModel>> getFavorites({
    String? userId,
    ContentType? contentType,
  });

  /// Get only guest favorites (userId == 'guest').
  Future<List<FavoriteModel>> getGuestFavorites();

  /// Add a single favorite.
  Future<void> addFavorite(FavoriteModel favorite);

  /// Remove a single favorite.
  Future<void> removeFavorite(
    int specificId,
    ContentType contentType,
    String userId,
  );

  /// Batch-save multiple favorites (used during merge).
  Future<void> batchSaveFavorites(List<FavoriteModel> favorites);

  /// Batch-migrate favorites from one userId to another.
  Future<void> batchMigrateFavorites(
    List<FavoriteModel> favorites,
    String oldUserId,
    String newUserId,
  );

  /// Clear all guest favorites (after merge).
  Future<void> clearGuestFavorites();
}
