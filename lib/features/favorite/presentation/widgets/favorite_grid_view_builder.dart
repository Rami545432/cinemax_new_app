import 'package:cinemax_app_new/core/utils/animations/generic_animated_widget.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteGridViewBuilder extends StatelessWidget {
  const FavoriteGridViewBuilder({super.key, required this.filteredFavorites});
  final List<FavoriteEntity> filteredFavorites;

  @override
  Widget build(BuildContext context) {
    return GenericAnimatedWidget<FavoriteEntity>(
      widgetType: GenericAnimatedWidgetType.grid,
      items: filteredFavorites,
      itemBuilder: (item, onRemove) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: FavoriteVerticalCard(item: item, onRemove: onRemove),
      ),
      onItemRemoved: (item) {
        context.read<FavoriteCubit>().toggleFavorite(item);
      },
    );
  }
}
