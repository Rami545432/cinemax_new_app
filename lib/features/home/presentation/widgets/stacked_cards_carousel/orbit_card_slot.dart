import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_model.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/orbit_utlis.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class OrbitCardSlot extends StatelessWidget {
  const OrbitCardSlot({
    super.key,
    required this.current,
    required this.cards,
    required this.buildMainCard,
    required this.buildMediumCard,
    required this.buildMiniCard,
    required this.slot,
  });

  final int current;
  final List<CardDisplayModel> cards;
  final Widget Function(CardDisplayModel model) buildMainCard;
  final Widget Function(String image)? buildMediumCard;
  final Widget Function(String image) buildMiniCard;
  final OrbitSlot slot;

  @override
  Widget build(BuildContext context) {
    final index = orbitIndex(current, slot.offset, cards.length);
    final model = cards[index];

    return switch (slot.offset.abs()) {
      0 => buildMainCard(model),
      _ =>
        (buildMediumCard != null)
            ? buildMediumCard!(model.posterPath)
            : buildMiniCard(model.posterPath),
    };
  }
}
