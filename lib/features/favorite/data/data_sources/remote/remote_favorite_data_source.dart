import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';

abstract class RemoteFavoriteDataSource {
  Future<List<FavoriteModel>> getFavorites(String userId);
  Future<void> saveFavorite(FavoriteModel favorite);
  Future<void> batchSaveFavorites(List<FavoriteModel> favorites);
  Future<void> deleteFavorite(
    String userId,
    int specificId,
    ContentType contentType,
  );
  Future<bool> isFavorite(
    String userId,
    int specificId,
    ContentType contentType,
  );
}
