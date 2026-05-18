import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/auth/auth_status_provider.dart';
import 'package:movify/core/network/utils/safe_emit_state.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/get_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_state.dart';

/// Favorites Cubit — Simplified Local-First
///
/// All reads from Hive. Firestore is fire-and-forget backup.
/// Zero Firestore reads during normal usage.
@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final MergeGuestFavoritesUseCase mergeGuestFavoritesUseCase;
  final PullCloudFavoritesUseCase pullCloudFavoritesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final AuthStatusProvider authStatusProvider;
  late final StreamSubscription<AuthStatusEvent> _authSub;
  String _currentUserId = 'guest';
  bool _initialized = false;

  FavoriteCubit({
    required this.mergeGuestFavoritesUseCase,
    required this.pullCloudFavoritesUseCase,
    required this.getFavoritesUseCase,
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
    required this.authStatusProvider,
  }) : super(const FavoriteInitial()) {
    _authSub = authStatusProvider.authStatusStream.listen(_onAuthChanged);
    // ✅ Start listening immediately
    _initFromCurrentSession();
  }

  Future<void> _initFromCurrentSession() async {
    final currentStatus = await authStatusProvider.currentAuthStatus;

    await _onAuthChanged(currentStatus); // guest is fine, no Firestore
  }

  Future<void> _onAuthChanged(AuthStatusEvent event) async {
    debugPrint(
      '🎯 FavoriteCubit._onAuthChanged → ${event.status} | ${event.userId}',
    );

    switch (event.status) {
      case AuthStatus.authenticated:
        await _handleSignIn(
          // ✅ awaited
          userId: event.userId!,
          isFirstSignIn: event.isFirstSignIn,
        );
        break;
      case AuthStatus.guest:
        _initialized = false; // ✅ reset for next sign in
        _currentUserId = 'guest';
        await loadFavorites(); // ✅ awaited
        break;
      case AuthStatus.unauthenticated:
        _initialized = false; // ✅ reset
        _currentUserId = 'guest';
        safeEmit(const FavoriteInitial());
        break;
    }
  }

  String get currentUserId => _currentUserId;

  // ═══════════════════════════════════════════════════════════════════
  // USER MANAGEMENT
  // ═══════════════════════════════════════════════════════════════════

  /// Sign-in flow: merge guest data + pull cloud + load.
  ///
  /// Called ONCE on explicit sign-in.
  /// This is the ONLY path that reads from Firestore.
  Future<void> _handleSignIn({
    required String userId,
    required bool isFirstSignIn,
  }) async {
    // ✅ Guard now works correctly
    // _currentUserId starts as 'guest' so first call passes
    // second call with same userId is blocked
    if (_initialized && _currentUserId == userId) {
      debugPrint('⚠️ Already initialized for $userId — skipping');
      return;
    }

    _initialized = true;
    _currentUserId = userId;

    // ✅ Only merge on explicit sign in — NOT on app restart
    if (isFirstSignIn) {
      debugPrint('🔐 First sign in — merging guest favorites');
      final result = await mergeGuestFavoritesUseCase(userId);
      result.fold(
        (failure) => debugPrint('⚠️ Merge failed: ${failure.errorMessage}'),
        (_) => debugPrint('✅ Merge complete'),
      );
    } else {
      debugPrint('🔄 App restart — skipping merge, loading from Hive only');
    }

    await loadFavorites(); // always load from Hive
  }

  // ═══════════════════════════════════════════════════════════════════
  // LOAD FAVORITES — Always from Hive
  // ═══════════════════════════════════════════════════════════════════

  Future<void> loadFavorites({ContentType? contentType}) async {
    safeEmit(const FavoriteLoading());

    final result = await getFavoritesUseCase(
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
    final result = await getFavoritesUseCase(
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
        ? await removeFavoriteUseCase(
            specificId: favorite.specificId,
            contentType: favorite.contentType,
            userId: _currentUserId,
          )
        : await addFavoriteUseCase(favorite.copyWith(userId: _currentUserId));

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
    final result = await pullCloudFavoritesUseCase(_currentUserId);

    result.fold(
      (failure) => debugPrint('⚠️ Refresh failed: ${failure.errorMessage}'),
      (_) => debugPrint('✅ Cloud refresh complete'),
    );

    await loadFavorites();
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
  // ═══════════════════════════════════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════════════════════════════════

  Future<List<FavoriteEntity>> getAllFavorites() async {
    final result = await getFavoritesUseCase(userId: _currentUserId);
    return result.fold((_) => [], (list) => list);
  }

  String _key(int id, ContentType type) => '${type.name}_$id';
}
