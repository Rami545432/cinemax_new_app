import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/features/home/presentation/widgets/search_vertical_card.dart';
import 'package:movify/features/search/data/models/search_result.dart';
import 'package:movify/features/search/presentation/widgets/simple_animated_card.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.result});

  final SearchResult result;

  @override
  Widget build(BuildContext context) => switch (result) {
    MovieResult(:final movie) => SimpleAnimatedCard(
      child: SearchVerticalCard(cardModel: movie.toCardDisplay()),
    ),
    TvShowResult(:final tvShow) => SimpleAnimatedCard(
      child: SearchVerticalCard(cardModel: tvShow.toCardDisplay()),
    ),
  };
}
