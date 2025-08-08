import '../../../../core/utils/enums/content_type.dart';
import '../../data/models/favorite_model.dart';

abstract class FavoriteRepo {
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int id, ContentType contentType);
  Future<List<FavoriteModel>> getFavoritesByType(ContentType contentType);
  Future<bool> isFavorite(int id, ContentType contentType);
  Future<void> syncGuestItemsToUser(ContentType contentType);
  Future<void> loadUserFavorites(ContentType contentType);
}
