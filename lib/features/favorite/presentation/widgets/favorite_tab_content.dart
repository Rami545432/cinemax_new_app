import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/constant.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_state.dart';
import 'package:movify/features/favorite/presentation/widgets/favorite_vertical_card.dart';
import 'package:movify/l10n/app_localizations.dart';

/// Single tab view (Movies, Series, or Episodes)
///
/// Features:
/// - Pull-to-refresh
/// - Displays list from Hive
/// - Empty state
class FavoriteTabView extends StatefulWidget {
  final ContentType contentType;

  const FavoriteTabView({super.key, required this.contentType});

  @override
  State<FavoriteTabView> createState() => _FavoriteTabViewState();
}

class _FavoriteTabViewState extends State<FavoriteTabView> {
  List<FavoriteEntity> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);

    final favorites = await context.read<FavoriteCubit>().getFavoritesByType(
      widget.contentType,
    );

    if (mounted) {
      setState(() {
        _favorites = favorites;
        _isLoading = false;
      });
    }
  }

  Future<void> _onRefresh() async {
    // Pull-to-refresh: Sync from cloud and update Hive
    await context.read<FavoriteCubit>().refreshFromCloud();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // Reload when favorites change
        if (state is FavoriteLoaded) {
          _loadFavorites();
        }
      },
      builder: (context, state) {
        if (_isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppPrimaryColors.blueAccent,
            ),
          );
        }

        return state.maybeWhen(
          error: (message) => RefreshIndicator(
            onRefresh: _onRefresh,
            child: Center(child: Text(message)),
          ),
          orElse: () {
            if (_favorites.isEmpty) {
              return Center(
                child: Text(
                  l10n.noFavoritesContentType(
                    widget.contentType.localizedText(context),
                  ),
                ),
              );
            }
            return RefreshIndicator(
              color: Colors.white,
              onRefresh: _onRefresh,
              child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: _favorites.length,
                gridDelegate: Constants.sliverGridDelegate(width),
                itemBuilder: (context, index) {
                  final favorite = _favorites[index];
                  return FavoriteVerticalCard(
                    item: favorite,
                    onRemove: () {
                      context.read<FavoriteCubit>().toggleFavorite(favorite);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
