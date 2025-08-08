import 'package:hive/hive.dart';

import '../../../../core/utils/enums/content_type.dart';
import '../models/favorite_model.dart';
import 'local_favorite_data_source.dart';

class LocalFavoriteDataSourceImpl implements LocalFavoriteDataSource {
  static const String _boxName = 'favoritestsss';

  Box<FavoriteModel> get box => Hive.box<FavoriteModel>(_boxName);

  @override
  Future<List<FavoriteModel>> getFavorites(ContentType contentType) async {
    final favorites = box.values
        .where((favorite) => favorite.contentType == contentType)
        .toList();
    return favorites;
  }

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    await box.add(favorite);
  }

  @override
  Future<void> removeFavorite(int id, ContentType contentType) async {
    final key = box.keys.firstWhere(
      (key) =>
          box.get(key)?.id == id && box.get(key)?.contentType == contentType,
    );
    await box.delete(key);
  }

  @override
  Future<List<FavoriteModel>> syncFavorites(
    List<FavoriteModel> favorites,
  ) async {
    for (var favorite in favorites) {
      await box.put(favorite.id, favorite);
    }
    // Return all favorites after sync
    return box.values.toList();
  }

  @override
  Future<List<FavoriteModel>> clearGuestFavorites() async {
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
    final favorite = box.get(id);
    if (favorite != null) {
      await box.put(id, favorite.copyWith(isSynced: isSynced));
      // Return updated list of favorites for the same user
      return getFavorites(favorite.contentType);
    }
    return [];
  }

  @override
  Future<bool> isFavorite(int id, ContentType contentType) async {
    final favorite = box.values.any(
      (element) => element.id == id && element.contentType == contentType,
    );
    return favorite;
  }
}
