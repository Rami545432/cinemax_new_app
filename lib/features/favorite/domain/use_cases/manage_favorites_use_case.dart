import '../../../../core/utils/enums/content_type.dart';
import '../../data/models/favorite_model.dart';
import '../repos/favorite_repo.dart';

class ManageFavoritesUseCase {
  final FavoriteRepo _favoriteRepo;

  ManageFavoritesUseCase({required FavoriteRepo favoriteRepo})
    : _favoriteRepo = favoriteRepo;

  Future<void> addFavorite(FavoriteModel favorite) async {
    await _favoriteRepo.addFavorite(favorite);
  }

  Future<void> removeFavorite(int id, ContentType contentType) async {
    await _favoriteRepo.removeFavorite(id, contentType);
  }

  Future<List<FavoriteModel>> getFavoritesByType(
    ContentType contentType,
  ) async {
    return await _favoriteRepo.getFavoritesByType(contentType);
  }

  Future<bool> isFavorite(int id, ContentType contentType) async {
    return await _favoriteRepo.isFavorite(id, contentType);
  }

  Future<void> syncGuestItemsToUser(ContentType contentType) async {
    await _favoriteRepo.syncGuestItemsToUser(contentType);
  }

  Future<void> loadUserFavorites(ContentType contentType) async {
    await _favoriteRepo.loadUserFavorites(contentType);
  }
}
