import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/favorite_entity.dart';
import '../../domain/use_cases/manage_favorites_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ManageFavoritesUseCase manageFavoritesUseCase;

  FavoriteCubit({required this.manageFavoritesUseCase})
    : super(FavoriteInitial());

  // Load all favorites at app start or when needed
  Future<void> loadAllFavorites() async {
    try {
      emit(FavoriteLoading());

      // Get all favorites from database
      final allFavorites = await manageFavoritesUseCase.getAllFavorites();

      // Build status map
      final Map<String, bool> statusMap = {};
      for (var favorite in allFavorites) {
        final key = _generateKey(favorite.specificId, favorite.contentType);
        statusMap[key] = true;
      }

      emit(
        FavoriteLoaded(favoriteStatuses: statusMap, allFavorites: allFavorites),
      );
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  // Toggle favorite (add or remove)
  Future<void> toggleFavorite(FavoriteEntity favorite) async {
    final currentState = state;
    if (currentState is! FavoriteLoaded) return;

    final key = _generateKey(favorite.specificId, favorite.contentType);
    final isFavorite = currentState.favoriteStatuses[key] ?? false;

    try {
      if (isFavorite) {
        // Remove from favorites
        await manageFavoritesUseCase.removeFavorite(
          favorite.specificId,
          favorite.contentType,
        );

        // Update state
        final newStatuses = Map<String, bool>.from(
          currentState.favoriteStatuses,
        );
        newStatuses[key] = false;

        final newFavorites = currentState.allFavorites
            .where(
              (f) =>
                  !(f.specificId == favorite.specificId &&
                      f.contentType == favorite.contentType),
            )
            .toList();

        emit(
          currentState.copyWith(
            favoriteStatuses: newStatuses,
            allFavorites: newFavorites,
          ),
        );
      } else {
        // Add to favorites
        await manageFavoritesUseCase.addFavorite(favorite);

        // Update state
        final newStatuses = Map<String, bool>.from(
          currentState.favoriteStatuses,
        );
        newStatuses[key] = true;

        final newFavorites = List<FavoriteEntity>.from(
          currentState.allFavorites,
        )..add(favorite);

        emit(
          currentState.copyWith(
            favoriteStatuses: newStatuses,
            allFavorites: newFavorites,
          ),
        );
      }
    } catch (e) {
      emit(FavoriteError(e.toString()));
      // Restore previous state
      emit(currentState);
    }
  }

  // Get favorites by type (for favorites screen)
  List<FavoriteEntity> getFavoritesByType(ContentType contentType) {
    final currentState = state;
    if (currentState is! FavoriteLoaded) return [];

    return currentState.allFavorites
        .where((f) => f.contentType == contentType)
        .toList();
  }

  // Check if specific item is favorite
  bool isFavorite(int id, ContentType contentType) {
    final currentState = state;
    if (currentState is! FavoriteLoaded) return false;

    return currentState.isFavorite(id, contentType);
  }

  String _generateKey(int id, ContentType contentType) {
    return '${contentType.name}_$id';
  }
}
