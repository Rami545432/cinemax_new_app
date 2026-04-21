import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

/// Favorite state — minimal.
///
/// No sync fields, no unsynced count, no last-sync time.
/// Hive is truth; UI only needs the status map.
@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;

  const factory FavoriteState.loading() = FavoriteLoading;

  /// Map of "contentType_id" → true for fast heart-icon lookup.
  const factory FavoriteState.loaded({
    required Map<String, bool> favoriteStatuses,
    required String currentUserId,
  }) = FavoriteLoaded;

  const factory FavoriteState.error({required String message}) = FavoriteError;
}
