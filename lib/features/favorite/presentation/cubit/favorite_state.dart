part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final Map<String, bool> favoriteStatuses; // key: "contentType_id"
  final List<FavoriteEntity> allFavorites;

  const FavoriteLoaded({
    required this.favoriteStatuses,
    required this.allFavorites,
  });

  @override
  List<Object?> get props => [favoriteStatuses, allFavorites];

  // Helper method to check if item is favorite
  bool isFavorite(int id, ContentType contentType) {
    final key = _generateKey(id, contentType);
    return favoriteStatuses[key] ?? false;
  }

  static String _generateKey(int id, ContentType contentType) {
    return '${contentType.name}_$id';
  }

  // Create a copy with updated status
  FavoriteLoaded copyWith({
    Map<String, bool>? favoriteStatuses,
    List<FavoriteEntity>? allFavorites,
  }) {
    return FavoriteLoaded(
      favoriteStatuses: favoriteStatuses ?? this.favoriteStatuses,
      allFavorites: allFavorites ?? this.allFavorites,
    );
  }
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
