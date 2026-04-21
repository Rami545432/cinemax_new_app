// Create a dedicated animated item wrapper

import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/search_vertical_card.dart';
import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/custom_grid_config.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/simple_animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedSearchResultItem extends StatelessWidget {
  final SearchResult result;
  final int index;

  final bool shouldAnimate;
  final bool isFirstSearch;

  const AnimatedSearchResultItem({
    super.key,
    required this.result,
    required this.index,

    required this.shouldAnimate,
    required this.isFirstSearch,
  });

  @override
  Widget build(BuildContext context) {
    final resultCard = _buildResultCard(result, context);

    if (!shouldAnimate) {
      return resultCard;
    }

    return AnimationLimiter(
      key: ValueKey(_getItemId(result)),
      child: AnimationConfiguration.staggeredGrid(
        position: index,
        duration: Duration(milliseconds: isFirstSearch ? 500 : 400),
        columnCount: CustomGridConfig.getCrossAxisCount(context),
        child: SlideAnimation(
          verticalOffset: isFirstSearch ? 50.0 : 30.0,
          curve: isFirstSearch ? Curves.easeOutQuart : Curves.easeOutCubic,
          child: FadeInAnimation(
            curve: Curves.easeOut,
            child: ScaleAnimation(
              scale: isFirstSearch ? 0.8 : 0.9,
              curve: Curves.easeOutBack,
              child: resultCard,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(SearchResult result, BuildContext context) =>
      switch (result) {
        MovieResult(:final movie) => SimpleAnimatedCard(
          child: SearchVerticalCard(cardModel: movie.toCardDisplay()),
        ),
        TvShowResult(:final tvShow) => SimpleAnimatedCard(
          child: SearchVerticalCard(cardModel: tvShow.toCardDisplay()),
        ),
      };

  String _getItemId(SearchResult result) => switch (result) {
    MovieResult(:final movie) => 'movie-${movie.id}',
    TvShowResult(:final tvShow) => 'tv-${tvShow.id}',
  };
}
