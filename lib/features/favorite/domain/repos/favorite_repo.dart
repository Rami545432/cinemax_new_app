import 'package:cinemax_app_new/core/utils/enums/content_type.dart';

import '../entities/favorite_entity.dart';

abstract class FavoriteRepo {
  Future<void> addFavorite(FavoriteEntity favorite);
  Future<void> removeFavorite(int id, ContentType contentType);
  Future<List<FavoriteEntity>> getFavoritesByType(ContentType contentType);
  Future<bool> isFavorite(int id, ContentType contentType);
  Future<void> syncGuestItemsToUser(ContentType contentType);
  Future<void> loadUserFavorites(ContentType contentType);
  Future<List<FavoriteEntity>> getAllFavorites();
}
