import 'package:cinemax_app_new/core/utils/enums/content_type.dart';

import '../../domain/entities/favorite_entity.dart';
import '../../domain/repos/favorite_repo.dart';
import '../models/favorite_model.dart';
import '../remote_favorite_data_source/remote_favorite_data_source.dart';
import '../local_favorite_data_source/local_favorite_data_source.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final RemoteFavoriteDataSource _remoteDataSource;
  final LocalFavoriteDataSource _localDataSource;

  FavoriteRepoImpl({
    required RemoteFavoriteDataSource remoteDataSource,
    required LocalFavoriteDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<void> addFavorite(FavoriteEntity favorite) async {
    try {
      final model = FavoriteModel.fromEntity(favorite);

      // Add to local storage and get updated list
      await _localDataSource.addFavorite(model);

      // If user is not guest, sync with remote
      if (favorite.userId != 'guest') {
        await _remoteDataSource.addFavorite(model);
        await _localDataSource.updateFavoriteSyncStatus(model.id, true);
      }
    } catch (e) {
      throw Exception('Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFavorite(int id, ContentType contentType) async {
    try {
      // Remove from local storage and get updated list
      await _localDataSource.removeFavorite(id, contentType);

      // If user is not guest, remove from remote
      // await _remoteDataSource.removeFavorite(id);
    } catch (e) {
      throw Exception('Failed to remove favorite: $e');
    }
  }

  @override
  Future<List<FavoriteEntity>> getFavoritesByType(
    ContentType contentType,
  ) async {
    try {
      // Get from local storage
      final favorites = await _localDataSource.getFavorites(contentType);
      return favorites
          .where((favorite) => favorite.contentType == contentType)
          .map((favorite) => favorite.toEntity())
          .toList();
    } catch (e) {
      throw Exception('Failed to get favorites by type: $e');
    }
  }

  @override
  Future<bool> isFavorite(int id, ContentType contentType) async {
    try {
      return await _localDataSource.isFavorite(id, contentType);
    } catch (e) {
      throw Exception('Failed to check favorite status: $e');
    }
  }

  @override
  Future<void> loadUserFavorites(ContentType contentType) {
    throw UnimplementedError();
  }

  @override
  Future<void> syncGuestItemsToUser(ContentType contentType) {
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteEntity>> getAllFavorites() async {
    final favorites = await _localDataSource.getAllFavorites();
    return favorites.map((favorite) => favorite.toEntity()).toList();
  }

  // Future<void> syncGuestItemsToUser(ContentType contentType) async {
  //   try {
  //     // Get guest favorites from local storage
  //     final guestFavorites = await _localDataSource.getFavorites(contentType);

  //     // Get user favorites from remote
  //     final userFavorites = await _remoteDataSource.getFavorites(contentType);

  //     // Update guest favorites with user ID
  //     final updatedFavorites = guestFavorites.map((favorite) {
  //       return favorite.copyWith(userId: 'guest', isSynced: true);
  //     }).toList();

  //     // Merge with existing user favorites
  //     final allFavorites = [...userFavorites, ...updatedFavorites];

  //     // Remove duplicates based on id
  //     final uniqueFavorites = allFavorites.toSet().toList();

  //     // Sync to remote
  //     await _remoteDataSource.syncFavorites(uniqueFavorites);

  //     // Update local storage
  //     await _localDataSource.syncFavorites(uniqueFavorites);

  //     // Clear guest favorites from local storage
  //     await _localDataSource.clearGuestFavorites();
  //   } catch (e) {
  //       throw Exception('Failed to sync guest items to user: $e');
  //     }
  //   }

  //   @override
  //   Future<void> loadUserFavorites(ContentType contentType) async {
  //     try {
  //       // Get favorites from remote
  //       final favorites = await _remoteDataSource.getFavorites(contentType);

  //       // Update local storage
  //       await _localDataSource.syncFavorites(favorites);
  //     } catch (e) {
  //       throw Exception('Failed to load user favorites: $e');
  //     }
  //   }
  // }
}
