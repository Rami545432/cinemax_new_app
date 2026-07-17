import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:movify/features/favorite/presentation/widgets/particle_heart_button.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.favoriteEntity});

  final FavoriteEntity favoriteEntity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    return BlocSelector<FavoriteCubit, FavoriteState, bool>(
      selector: (state) => cubit.isFavorite(
        favoriteEntity.specificId,
        favoriteEntity.contentType,
      ),
      builder: (context, isFavorited) => ParticleHeartButton(
        isFavorited: isFavorited,
        onTap: () {
          HapticFeedback.heavyImpact();
          cubit.toggleFavorite(favoriteEntity);
        },
      ),
    );
  }
}
