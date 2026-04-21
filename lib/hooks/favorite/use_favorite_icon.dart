import 'package:flutter/material.dart';

Widget useFavoriteIcon(bool isFavorite, String uniqueId, bool isLoading) {
  if (isLoading) {
    return SizedBox(
      key: ValueKey('Loading-$uniqueId'),
      width: 24,
      height: 24,
      child: const Icon(Icons.favorite_border, color: Colors.grey),
    );
  }
  return AnimatedSwitcher(
    key: ValueKey('FavoriteIcon-$uniqueId'),
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (child, animation) => ScaleTransition(
      scale: animation,
      child: FadeTransition(opacity: animation, child: child),
    ),
    child: isFavorite
        ? Icon(
            Icons.favorite,
            color: Colors.red,
            key: ValueKey('Favorite-$uniqueId'),
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.grey,
            key: ValueKey('NotFavorite-$uniqueId'),
          ),
  );
}
