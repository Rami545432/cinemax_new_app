import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_error_widget.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_grid_view_builder.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favortie_empty_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBuildList extends StatelessWidget {
  const FavoriteBuildList({super.key, required this.type});
  final ContentType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) {
        // Only rebuild when favorites for this specific type change
        if (previous is FavoriteLoaded && current is FavoriteLoaded) {
          final prevFavorites = previous.allFavorites
              .where((f) => f.contentType == type)
              .length;
          final currFavorites = current.allFavorites
              .where((f) => f.contentType == type)
              .length;
          return prevFavorites != currFavorites;
        }
        return true;
      },
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FavoriteError) {
          return Center(
            child: FavoriteErrorWidget(errorMessage: state.message),
          );
        }

        if (state is FavoriteLoaded) {
          // Filter favorites by current content type
          final filteredFavorites = context
              .read<FavoriteCubit>()
              .getFavoritesByType(type);

          if (filteredFavorites.isEmpty) {
            return Center(child: FavortieEmptyList(type: type));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: FavoriteGridViewBuilder(
              filteredFavorites: filteredFavorites,
            ),
          );
        }

        // Initial state or unexpected state
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
