import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/favorite_entity.dart';
import '../cubit/favorite_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.favorite});

  final FavoriteEntity favorite;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) {
        // Only rebuild when favorite status changes for THIS item
        if (previous is FavoriteLoaded && current is FavoriteLoaded) {
          return previous.isFavorite(
                favorite.specificId,
                favorite.contentType,
              ) !=
              current.isFavorite(favorite.specificId, favorite.contentType);
        }
        return true;
      },
      builder: (context, state) {
        final isFavorite = state is FavoriteLoaded
            ? state.isFavorite(favorite.specificId, favorite.contentType)
            : false;

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: IconButton(
            onPressed: () {
              context.read<FavoriteCubit>().toggleFavorite(favorite);
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : Colors.grey,
            key: ValueKey('favorite_$isFavorite'),
          ),
        );
      },
    );
  }
}
