part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final int itemId;
  final ContentType contentType;

  const FavoriteSuccess({required this.itemId, required this.contentType});

  @override
  List<Object> get props => [itemId, contentType];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError({required this.message});

  @override
  List<Object> get props => [message];
}

class FavoritesLoaded extends FavoriteState {
  final List<FavoriteModel> favorites;

  const FavoritesLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class FavoriteStatusChecked extends FavoriteState {
  final bool isFavorite;
  final int itemId;
  final ContentType contentType;

  const FavoriteStatusChecked({
    required this.isFavorite,
    required this.itemId,
    required this.contentType,
  });

  @override
  List<Object> get props => [isFavorite, itemId, contentType];
}
