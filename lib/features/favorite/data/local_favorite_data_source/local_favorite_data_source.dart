import '../../../../core/utils/enums/content_type.dart';
import '../models/favorite_model.dart';

abstract class LocalFavoriteDataSource {
  Future<List<FavoriteModel>> getFavorites(ContentType contentType);
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int id, ContentType contentType);
  Future<List<FavoriteModel>> syncFavorites(List<FavoriteModel> favorites);
  Future<List<FavoriteModel>> clearGuestFavorites();
  Future<List<FavoriteModel>> updateFavoriteSyncStatus(int id, bool isSynced);
  Future<bool> isFavorite(int id, ContentType contentType);
}
