import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/errors/expections.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/data_sources/local/local_favorite_data_source.dart';
import 'package:movify/features/favorite/data/data_sources/remote/remote_favorite_data_source.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

class FavoritesRepositoryImpl implements FavoriteRepo {
  final LocalFavoriteDataSource localDataSource;
  final RemoteFavoriteDataSource remoteDataSource;

  FavoritesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  // ══════════════════════════════════════════════════════════════════════
  // READ — Always local, always fast, always free
  // ══════════════════════════════════════════════════════════════════════

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites({
    required String userId,
    ContentType? contentType,
  }) async {
    try {
      final models = await localDataSource.getFavorites(
        userId: userId,
        contentType: contentType,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'Failed to load favorites: $e'));
    }
  }

  // ══════════════════════════════════════════════════════════════════════
  // WRITE — Hive first, Firestore fire-and-forget
  // ══════════════════════════════════════════════════════════════════════

  @override
  Future<Either<Failure, Unit>> addFavorite(FavoriteEntity favorite) async {
    try {
      final model = FavoriteModel.fromEntity(favorite);

      // 1. Save to Hive immediately
      await localDataSource.addFavorite(model);
      debugPrint('✅ Added to Hive: ${model.title}');

      // 2. Fire-and-forget to Firestore (if signed in)
      if (favorite.userId != 'guest') {
        _fireAndForget(() => remoteDataSource.saveFavorite(model));
      }

      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'Failed to add favorite: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite({
    required int specificId,
    required ContentType contentType,
    required String userId,
  }) async {
    try {
      // 1. Remove from Hive immediately
      await localDataSource.removeFavorite(specificId, contentType, userId);
      debugPrint('🗑️ Removed from Hive: $specificId');

      // 2. Fire-and-forget to Firestore (if signed in)
      if (userId != 'guest') {
        _fireAndForget(
          () =>
              remoteDataSource.deleteFavorite(userId, specificId, contentType),
        );
      }

      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'Failed to remove favorite: $e'));
    }
  }

  // ══════════════════════════════════════════════════════════════════════
  // MERGE — Guest → Signed-in user (called once on sign-in)
  // ══════════════════════════════════════════════════════════════════════

  @override
  Future<Either<Failure, Unit>> mergeGuestFavorites(String newUserId) async {
    try {
      // 1. Get guest favorites from Hive
      final guestFavs = await localDataSource.getGuestFavorites();
      if (guestFavs.isEmpty) {
        await _pullCloud(newUserId);
        debugPrint('ℹ️ No guest favorites to merge');

        return const Right(unit);
      }
      debugPrint('📦 Found ${guestFavs.length} guest favorites to merge');

      // 2. Get cloud favorites (ONE Firestore read)
      List<FavoriteModel> cloudFavs = [];
      try {
        cloudFavs = await remoteDataSource.getFavorites(newUserId);
      } catch (e) {
        debugPrint('⚠️ Could not read cloud (offline?): $e');
      }

      // 3. Build cloud lookup set
      final cloudKeys = <String>{};
      for (final c in cloudFavs) {
        cloudKeys.add('${c.specificId}_${c.contentType.name}');
      }

      // 4. Upload NEW guest favorites to cloud (ones not already in cloud)
      final newItems = guestFavs.where((g) {
        final key = '${g.specificId}_${g.contentType.name}';
        return !cloudKeys.contains(key);
      }).toList();

      if (newItems.isNotEmpty) {
        final toUpload = newItems
            .map((f) => f.copyWith(userId: newUserId))
            .toList();
        try {
          await remoteDataSource.batchSaveFavorites(toUpload);
          debugPrint('☁️ Uploaded ${toUpload.length} new items to cloud');
        } catch (e) {
          debugPrint('⚠️ Upload failed (offline?): $e');
        }
      }

      // 5. Re-key guest favorites in Hive (guest → userId)
      await localDataSource.batchMigrateFavorites(
        guestFavs,
        'guest',
        newUserId,
      );
      debugPrint('💾 Migrated Hive data: guest → $newUserId');

      // 6. Download cloud-only favorites to Hive
      final localKeys = <String>{};
      for (final g in guestFavs) {
        localKeys.add('${g.specificId}_${g.contentType.name}');
      }
      final cloudOnly = cloudFavs.where((c) {
        final key = '${c.specificId}_${c.contentType.name}';
        return !localKeys.contains(key);
      }).toList();

      if (cloudOnly.isNotEmpty) {
        final toSave = cloudOnly
            .map((f) => f.copyWith(userId: newUserId))
            .toList();
        await localDataSource.batchSaveFavorites(toSave);
        debugPrint('📥 Downloaded ${toSave.length} cloud-only favorites');
      }

      // 7. Clear remaining guest data
      await localDataSource.clearGuestFavorites();
      debugPrint('✅ Merge complete');

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(FireBaseFailure(errorMessage: 'Merge failed: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Merge failed: $e'));
    }
  }

  // ══════════════════════════════════════════════════════════════════════
  // PULL — Cloud → Hive (for multi-device sync / pull-to-refresh)
  // ══════════════════════════════════════════════════════════════════════

  @override
  Future<Either<Failure, Unit>> pullCloudFavorites(String userId) async {
    try {
      await _pullCloud(userId);
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(
        FireBaseFailure(errorMessage: 'Cloud pull failed: ${e.message}'),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Cloud pull failed: $e'));
    }
  }

  // ══════════════════════════════════════════════════════════════════════
  // PRIVATE HELPERS
  // ══════════════════════════════════════════════════════════════════════

  /// Pull cloud favorites and ADD any missing ones to Hive.
  /// Only adds — never deletes local data.
  Future<void> _pullCloud(String userId) async {
    final cloudFavs = await remoteDataSource.getFavorites(userId);
    if (cloudFavs.isEmpty) {
      return;
    }

    final localFavs = await localDataSource.getFavorites(userId: userId);
    final localKeys = <String>{};
    for (final l in localFavs) {
      localKeys.add('${l.specificId}_${l.contentType.name}');
    }

    final toAdd = cloudFavs
        .where((c) {
          final key = '${c.specificId}_${c.contentType.name}';
          return !localKeys.contains(key);
        })
        .map((f) => f.copyWith(userId: userId))
        .toList();

    if (toAdd.isNotEmpty) {
      await localDataSource.batchSaveFavorites(toAdd);
      debugPrint('📥 Pulled ${toAdd.length} items from cloud');
    } else {
      debugPrint('✅ Hive already in sync with cloud');
    }
  }

  /// Fire-and-forget async operation (don't block, don't crash).
  void _fireAndForget(Future<void> Function() operation) async {
    try {
      await operation();
    } catch (e) {
      debugPrint('⚠️ Background Firestore operation failed: $e');
    }
  }
}
