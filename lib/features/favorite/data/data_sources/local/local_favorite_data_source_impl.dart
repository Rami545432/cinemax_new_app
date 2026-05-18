import 'package:injectable/injectable.dart';
import 'package:movify/core/storage/hive/hive_service.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/data_sources/local/local_favorite_data_source.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';

@LazySingleton(as: LocalFavoriteDataSource)
class LocalFavoriteDataSourceImpl implements LocalFavoriteDataSource {
  String _key(int specificId, ContentType contentType, String userId) =>
      '${specificId}_${contentType.name}_$userId';

  @override
  Future<List<FavoriteModel>> getFavorites({
    String? userId,
    ContentType? contentType,
  }) async {
    final box = await HiveService.getNewFavoriteBox();
    var favorites = box.values.toList();

    if (userId != null) {
      favorites = favorites.where((f) => f.userId == userId).toList();
    }
    if (contentType != null) {
      favorites = favorites.where((f) => f.contentType == contentType).toList();
    }
    return favorites;
  }

  @override
  Future<List<FavoriteModel>> getGuestFavorites() async =>
      getFavorites(userId: 'guest');

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    final box = await HiveService.getNewFavoriteBox();
    final k = _key(favorite.specificId, favorite.contentType, favorite.userId);
    await box.put(k, favorite);
  }

  @override
  Future<void> removeFavorite(
    int specificId,
    ContentType contentType,
    String userId,
  ) async {
    final box = await HiveService.getNewFavoriteBox();
    await box.delete(_key(specificId, contentType, userId));
  }

  @override
  Future<void> batchSaveFavorites(List<FavoriteModel> favorites) async {
    final box = await HiveService.getNewFavoriteBox();
    final map = <String, FavoriteModel>{};
    for (final f in favorites) {
      map[_key(f.specificId, f.contentType, f.userId)] = f;
    }
    await box.putAll(map);
  }

  @override
  Future<void> batchMigrateFavorites(
    List<FavoriteModel> favorites,
    String oldUserId,
    String newUserId,
  ) async {
    if (favorites.isEmpty) {
      return;
    }

    final box = await HiveService.getNewFavoriteBox();
    final toAdd = <String, FavoriteModel>{};
    final toDelete = <String>[];

    for (final f in favorites) {
      toDelete.add(_key(f.specificId, f.contentType, oldUserId));
      toAdd[_key(f.specificId, f.contentType, newUserId)] = f.copyWith(
        userId: newUserId,
      );
    }

    await box.putAll(toAdd);
    await box.deleteAll(toDelete);
  }

  @override
  Future<void> clearGuestFavorites() async {
    final box = await HiveService.getNewFavoriteBox();
    final guestKeys = box.keys
        .where((k) => box.get(k)?.userId == 'guest')
        .toList();
    await box.deleteAll(guestKeys);
  }
}
