import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/get_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Favorites Cubit — Simplified Local-First
///
/// All reads from Hive. Firestore is fire-and-forget backup.
/// Zero Firestore reads during normal usage.
@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final MergeGuestFavoritesUseCase _mergeGuestFavoritesUseCase;
  final PullCloudFavoritesUseCase _pullCloudFavoritesUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;

  FavoriteCubit({
    required MergeGuestFavoritesUseCase mergeGuestFavoritesUseCase,
    required PullCloudFavoritesUseCase pullCloudFavoritesUseCase,
    required GetFavoritesUseCase getFavoritesUseCase,
    required AddFavoriteUseCase addFavoriteUseCase,
    required RemoveFavoriteUseCase removeFavoriteUseCase,
  }) : _mergeGuestFavoritesUseCase = mergeGuestFavoritesUseCase,
       _pullCloudFavoritesUseCase = pullCloudFavoritesUseCase,
       _getFavoritesUseCase = getFavoritesUseCase,
       _addFavoriteUseCase = addFavoriteUseCase,
       _removeFavoriteUseCase = removeFavoriteUseCase,
       super(const FavoriteInitial());

  String _currentUserId = 'guest';
  String get currentUserId => _currentUserId;

  // ═══════════════════════════════════════════════════════════════════
  // USER MANAGEMENT
  // ═══════════════════════════════════════════════════════════════════

  /// Set user and load favorites from Hive.
  ///
  /// Used for:
  ///   - App start (checkAuthStatus finds existing user)
  ///   - Sign-out (switch to 'guest')
  ///   - Guest mode
  Future<void> setUser(String userId) async {
    debugPrint('👤 FavoriteCubit.setUser → $userId');
    _currentUserId = userId;
    await loadFavorites();
  }

  /// Sign-in flow: merge guest data + pull cloud + load.
  ///
  /// Called ONCE on explicit sign-in.
  /// This is the ONLY path that reads from Firestore.
  Future<void> handleSignIn(String userId) async {
    debugPrint('🔐 FavoriteCubit.handleSignIn → $userId');
    _currentUserId = userId;

    // Merge guest favorites (if any) + pull cloud data
    final result = await _mergeGuestFavoritesUseCase(userId);
    result.fold(
      (failure) => debugPrint('⚠️ Merge failed: ${failure.errorMessage}'),
      (_) => debugPrint('✅ Merge complete'),
    );

    // Load merged favorites from Hive
    await loadFavorites();
  }

  // ═══════════════════════════════════════════════════════════════════
  // LOAD FAVORITES — Always from Hive
  // ═══════════════════════════════════════════════════════════════════

  Future<void> loadFavorites({ContentType? contentType}) async {
    safeEmit(const FavoriteLoading());

    final result = await _getFavoritesUseCase(
      userId: _currentUserId,
      contentType: contentType,
    );

    result.fold(
      (failure) {
        debugPrint('❌ Load failed: ${failure.errorMessage}');
        safeEmit(FavoriteError(message: failure.errorMessage));
      },
      (favorites) {
        final statuses = <String, bool>{};
        for (final f in favorites) {
          statuses[_key(f.specificId, f.contentType)] = true;
        }

        safeEmit(
          FavoriteLoaded(
            favoriteStatuses: statuses,
            currentUserId: _currentUserId,
          ),
        );

        debugPrint('✅ Loaded ${favorites.length} favorites from Hive');
      },
    );
  }

  /// Get favorites by type (for tab views).
  Future<List<FavoriteEntity>> getFavoritesByType(ContentType type) async {
    final result = await _getFavoritesUseCase(
      userId: _currentUserId,
      contentType: type,
    );
    return result.fold((_) => [], (list) => list);
  }

  // ═══════════════════════════════════════════════════════════════════
  // TOGGLE FAVORITE — Optimistic update
  // ═══════════════════════════════════════════════════════════════════

  Future<void> toggleFavorite(FavoriteEntity favorite) async {
    final current = state;
    if (current is! FavoriteLoaded) {
      return;
    }

    final key = _key(favorite.specificId, favorite.contentType);
    final isCurrentlyFav = current.favoriteStatuses[key] ?? false;

    debugPrint(
      '💫 Toggle: ${favorite.title} (${isCurrentlyFav ? "remove" : "add"})',
    );

    // 1. Optimistic UI update
    final newStatuses = Map<String, bool>.from(current.favoriteStatuses);
    if (isCurrentlyFav) {
      newStatuses.remove(key);
    } else {
      newStatuses[key] = true;
    }

    safeEmit(
      FavoriteLoaded(
        favoriteStatuses: newStatuses,
        currentUserId: _currentUserId,
      ),
    );

    // 2. Persist to Hive + fire-and-forget Firestore
    final result = isCurrentlyFav
        ? await _removeFavoriteUseCase(
            specificId: favorite.specificId,
            contentType: favorite.contentType,
            userId: _currentUserId,
          )
        : await _addFavoriteUseCase(favorite.copyWith(userId: _currentUserId));

    result.fold((failure) {
      // Rollback on failure
      debugPrint('❌ Toggle failed: ${failure.errorMessage}');
      safeEmit(
        FavoriteLoaded(
          favoriteStatuses: current.favoriteStatuses,
          currentUserId: _currentUserId,
        ),
      );
    }, (_) => debugPrint('✅ Toggle persisted'));
  }

  // ═══════════════════════════════════════════════════════════════════
  // CHECK STATUS — For heart icon (instant, from state map)
  // ═══════════════════════════════════════════════════════════════════

  bool isFavorite(int specificId, ContentType contentType) {
    if (state is FavoriteLoaded) {
      final key = _key(specificId, contentType);
      return (state as FavoriteLoaded).favoriteStatuses[key] ?? false;
    }
    return false;
  }

  // ═══════════════════════════════════════════════════════════════════
  // PULL-TO-REFRESH — Manual cloud sync
  // ═══════════════════════════════════════════════════════════════════

  Future<void> refreshFromCloud() async {
    if (_currentUserId == 'guest') {
      return;
    }

    debugPrint('🔄 Pull-to-refresh from cloud...');
    final result = await _pullCloudFavoritesUseCase(_currentUserId);

    result.fold(
      (failure) => debugPrint('⚠️ Refresh failed: ${failure.errorMessage}'),
      (_) => debugPrint('✅ Cloud refresh complete'),
    );

    await loadFavorites();
  }

  // ═══════════════════════════════════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════════════════════════════════

  Future<List<FavoriteEntity>> getAllFavorites() async {
    final result = await _getFavoritesUseCase(userId: _currentUserId);
    return result.fold((_) => [], (list) => list);
  }

  String _key(int id, ContentType type) => '${type.name}_$id';
}
