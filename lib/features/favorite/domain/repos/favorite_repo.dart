import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';

/// Favorites Repository — Local-First Architecture
///
/// Hive  = source of truth (all reads, instant writes)
/// Firestore = dumb backup (fire-and-forget writes, one-time pull on sign-in)
///
/// Firestore reads happen ONLY:
///   1. On explicit sign-in (ONE read to pull cloud data)
///   2. On pull-to-refresh (manual)
abstract class FavoriteRepo {
  /// Get favorites from Hive (always local, always fast, always free).
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites({
    required String userId,
    ContentType? contentType,
  });

  /// Add favorite: Hive write → fire-and-forget Firestore write.
  Future<Either<Failure, Unit>> addFavorite(FavoriteEntity favorite);

  /// Remove favorite: Hive delete → fire-and-forget Firestore delete.
  Future<Either<Failure, Unit>> removeFavorite({
    required int specificId,
    required ContentType contentType,
    required String userId,
  });

  /// Merge guest favorites into a signed-in account.
  ///
  /// Called ONCE on sign-in. Flow:
  ///   1. Read guest favorites from Hive
  ///   2. Read cloud favorites (ONE Firestore read)
  ///   3. Upload new guest items to cloud
  ///   4. Download cloud-only items to Hive
  ///   5. Re-key guest Hive data → userId
  ///   6. Clear guest data
  Future<Either<Failure, Unit>> mergeGuestFavorites(String newUserId);

  /// Pull cloud favorites into Hive (for multi-device sync).
  ///
  /// Called on pull-to-refresh. Only ADDS missing items (never deletes).
  /// ONE Firestore read per call.
  Future<Either<Failure, Unit>> pullCloudFavorites(String userId);
}
