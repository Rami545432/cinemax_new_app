import 'package:cinemax_app_new/features/favorite/data/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/show_snack_bar.dart';
import '../../domain/entities/favorite_entity.dart';
import '../cubit/favorite_cubit.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.favorite});
  final FavoriteEntity favorite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  bool _isFavorite = false;
  bool _isLoading = false; // Start with loading

  @override
  void initState() {
    _checkFavoriteStatus();
    _setAnimations();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.favorite.id != widget.favorite.id ||
        oldWidget.favorite.contentType != widget.favorite.contentType) {
      _checkFavoriteStatus();
    }
  }

  Future<void> _checkFavoriteStatus() async {
    setState(() {
      _isLoading = true;
    });
    await BlocProvider.of<FavoriteCubit>(
      context,
    ).checkFavoriteStatus(widget.favorite.id, widget.favorite.contentType);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _sizeAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _handleFavoriteToggle() {
    final cubit = BlocProvider.of<FavoriteCubit>(context);
    final model = widget.favorite;

    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    if (_isFavorite) {
      // Pass both id and contentType for proper context
      cubit.removeFavorite(model.id, model.contentType);
    } else {
      cubit.addFavorite(
        FavoriteModel(
          id: model.id,
          title: model.title,
          imageUrl: model.imageUrl,
          gener: model.gener,
          contentType: model.contentType,
          date: model.date,
        ),
      );
    }
  }

  bool _isStateForThisButton(FavoriteState state) {
    if (state is FavoriteStatusChecked) {
      return state.itemId == widget.favorite.id &&
          state.contentType == widget.favorite.contentType;
    }
    if (state is FavoriteSuccess) {
      return state.itemId == widget.favorite.id &&
          state.contentType == widget.favorite.contentType;
    }
    return false;
  }

  Widget _buildFavoriteIcon(String uniqueId) {
    if (_isLoading) {
      return SizedBox(
        key: ValueKey('Loading-$uniqueId'),
        width: 24,
        height: 24,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      );
    }
    if (_isFavorite) {
      return Icon(
        Icons.favorite,
        color: Colors.red,
        key: ValueKey('Favorite-$uniqueId'),
      );
    }
    return Icon(
      Icons.favorite_border,
      color: Colors.grey,
      key: ValueKey('NotFavorite-$uniqueId'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uniqueId =
        '${widget.favorite.id}-${widget.favorite.contentType.name}';

    return BlocListener<FavoriteCubit, FavoriteState>(
      key: ValueKey('listener-$uniqueId'),
      listener: (context, state) {
        if (_isStateForThisButton(state)) {
          if (state is FavoriteStatusChecked) {
            setState(() {
              _isFavorite = state.isFavorite;
              _isLoading = false;
            });
          } else if (state is FavoriteSuccess) {
            setState(() {
              _isLoading = false;
            });
            showSnackBar(
              context,
              color: Colors.green,
              text: 'Added to favorites',
            );
          }
        } else if (state is FavoriteError) {
          setState(() {
            _isLoading = false;
          });
          showSnackBar(context, color: Colors.red, text: state.message);
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _sizeAnimation.value,
            child: AnimatedOpacity(
              opacity: _opacityAnimation.value,
              duration: Duration(milliseconds: 300),
              child: IconButton(
                onPressed: _isLoading ? null : _handleFavoriteToggle,
                icon: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: _buildFavoriteIcon(uniqueId),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
