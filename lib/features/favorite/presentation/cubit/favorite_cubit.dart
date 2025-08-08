import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums/content_type.dart';
import '../../data/models/favorite_model.dart';
import '../../domain/use_cases/manage_favorites_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ManageFavoritesUseCase manageFavoritesUseCase;

  FavoriteCubit({required this.manageFavoritesUseCase})
    : super(FavoriteInitial());

  Future<void> addFavorite(FavoriteModel favorite) async {
    await manageFavoritesUseCase.addFavorite(favorite);
    emit(
      FavoriteStatusChecked(
        isFavorite: true,
        itemId: favorite.id,
        contentType: favorite.contentType,
      ),
    );
    emit(
      FavoriteSuccess(itemId: favorite.id, contentType: favorite.contentType),
    );
  }

  Future<void> removeFavorite(int id, ContentType contentType) async {
    await manageFavoritesUseCase.removeFavorite(id, contentType);
    emit(
      FavoriteStatusChecked(
        isFavorite: false,
        itemId: id,
        contentType: contentType,
      ),
    );
  }

  Future<List<FavoriteModel>> getFavoritesByType(
    ContentType contentType,
  ) async {
    final favorites = await manageFavoritesUseCase.getFavoritesByType(
      contentType,
    );
    emit(FavoritesLoaded(favorites: favorites));
    return favorites;
  }

  Future<bool> checkFavoriteStatus(int id, ContentType contentType) async {
    final isFavorite = await manageFavoritesUseCase.isFavorite(id, contentType);
    emit(
      FavoriteStatusChecked(
        isFavorite: isFavorite,
        itemId: id,
        contentType: contentType,
      ),
    );
    return isFavorite;
  }

  Future<void> syncGuestItemsToUser(ContentType contentType) async {
    await manageFavoritesUseCase.syncGuestItemsToUser(contentType);
  }

  Future<void> loadUserFavorites(ContentType contentType) async {
    await manageFavoritesUseCase.loadUserFavorites(contentType);
  }
}
