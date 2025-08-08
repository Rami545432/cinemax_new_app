import '../models/favorite_model.dart';

abstract class RemoteFavoriteDataSource {
  Future<List<FavoriteModel>> getFavorites(String userId);
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int id);
  Future<void> syncFavorites(List<FavoriteModel> favorites);
}
