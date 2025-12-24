import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/core/utils/hive/hive_service.dart';

import '../models/favorite_model.dart';
import 'local_favorite_data_source.dart';

class LocalFavoriteDataSourceImpl implements LocalFavoriteDataSource {
  @override
  Future<List<FavoriteModel>> getFavorites(ContentType contentType) async {
    final box = await HiveService.getFavoriteBox();
    final favorites = box.values
        .where((favorite) => favorite.contentType == contentType)
        .toList();

    return favorites;
  }

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    final box = await HiveService.getFavoriteBox();
    await box.add(favorite);
  }

  @override
  Future<void> removeFavorite(int id, ContentType contentType) async {
    final box = await HiveService.getFavoriteBox();
    final key = box.keys.firstWhere(
      (key) =>
          box.get(key)?.id == id && box.get(key)?.contentType == contentType,
      orElse: () => null,
    );
    if (key != null) {
      await box.delete(key);
    }
  }

  @override
  Future<List<FavoriteModel>> syncFavorites(
    List<FavoriteModel> favorites,
  ) async {
    final box = await HiveService.getFavoriteBox();
    for (var favorite in favorites) {
      await box.put(favorite.id, favorite);
    }
    // Return all favorites after sync
    return box.values.toList();
  }

  @override
  Future<List<FavoriteModel>> clearGuestFavorites() async {
    final box = await HiveService.getFavoriteBox();
    final guestKeys = box.keys
        .where((key) => box.get(key)?.userId == 'guest')
        .toList();
    await box.deleteAll(guestKeys);
    // Return remaining favorites
    return box.values.toList();
  }

  @override
  Future<List<FavoriteModel>> updateFavoriteSyncStatus(
    int id,
    bool isSynced,
  ) async {
    final box = await HiveService.getFavoriteBox();
    final favorite = box.get(id);
    if (favorite != null) {
      await box.put(id, favorite.copyWith(isSynced: isSynced));
      // Return updated list of favorites for the same user
      return await getFavorites(favorite.contentType);
    }
    return [];
  }

  @override
  Future<bool> isFavorite(int id, ContentType contentType) async {
    final box = await HiveService.getFavoriteBox();
    final favorite = box.values.any(
      (element) =>
          element.specificId == id && element.contentType == contentType,
    );
    return favorite;
  }

  @override
  Future<List<FavoriteModel>> getAllFavorites() async {
    final box = await HiveService.getFavoriteBox();
    return box.values.toList();
  }
}
