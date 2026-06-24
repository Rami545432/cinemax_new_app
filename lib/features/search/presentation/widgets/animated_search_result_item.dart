// Create a dedicated animated item wrapper

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movify/features/search/data/models/search_result.dart';
import 'package:movify/features/search/presentation/widgets/custom_grid_config.dart';
import 'package:movify/features/search/presentation/widgets/search_result_card.dart';

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
    final resultCard = SearchResultCard(result: result);

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

  String _getItemId(SearchResult result) => switch (result) {
    MovieResult(:final movie) => 'movie-${movie.id}',
    TvShowResult(:final tvShow) => 'tv-${tvShow.id}',
  };
}
