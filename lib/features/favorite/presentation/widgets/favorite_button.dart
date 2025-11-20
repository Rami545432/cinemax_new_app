import 'package:cinemax_app_new/core/utils/animations/animated_button.dart';
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

        final isLoading = state is FavoriteLoading || state is FavoriteInitial;

        return AnimatedButton(
          onPressed: isLoading
              ? null
              : () {
                  context.read<FavoriteCubit>().toggleFavorite(favorite);

                  // Show feedback
                  if (isFavorite) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Removed from favorites'),
                        backgroundColor: Colors.orange,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to favorites'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
          entranceAnimation: ButtonAnimationType.fade,
          pressAnimation: ButtonAnimationType.pulse,
          animationDuration: const Duration(milliseconds: 300),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  )
                : Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    key: ValueKey('favorite_$isFavorite'),
                  ),
          ),
        );
      },
    );
  }
}
