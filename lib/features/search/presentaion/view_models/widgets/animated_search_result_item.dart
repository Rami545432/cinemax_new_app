// Create a dedicated animated item wrapper

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../home/presentaion/views_models/widgets/search_vertical_card.dart';
import '../../../data/models/search_result.dart';
import 'simple_animated_card.dart';

class AnimatedSearchResultItem extends StatelessWidget {
  final SearchResult result;
  final int index;
  final int crossAxisCount;
  final bool shouldAnimate;
  final bool isFirstSearch;

  const AnimatedSearchResultItem({
    super.key,
    required this.result,
    required this.index,
    required this.crossAxisCount,
    required this.shouldAnimate,
    required this.isFirstSearch,
  });

  @override
  Widget build(BuildContext context) {
    final resultCard = _buildResultCard(result, context);

    if (!shouldAnimate) return resultCard;

    return AnimationLimiter(
      key: ValueKey(_getItemId(result)),
      child: AnimationConfiguration.staggeredGrid(
        position: index,
        duration: Duration(milliseconds: isFirstSearch ? 500 : 400),
        columnCount: crossAxisCount,
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

  Widget _buildResultCard(SearchResult result, BuildContext context) {
    return switch (result) {
      MovieResult(:final movie) => SimpleAnimatedCard(
        child: SearchVerticalCard(cardModel: movie),
      ),
      TvShowResult(:final tvShow) => SimpleAnimatedCard(
        child: SearchVerticalCard(cardModel: tvShow),
      ),
    };
  }

  String _getItemId(SearchResult result) {
    return switch (result) {
      MovieResult(:final movie) => 'movie-${movie.movieId}',
      TvShowResult(:final tvShow) => 'tv-${tvShow.tvId}',
    };
  }
}
