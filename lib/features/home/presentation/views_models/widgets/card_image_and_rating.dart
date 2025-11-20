import 'package:cinemax_app_new/core/utils/rating.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageAndRating extends StatelessWidget {
  const CardImageAndRating({super.key, required this.cardModel, this.title});
  final BaseCardModel cardModel;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: Stack(
        children: [
          CardImage(imageUrl: cardModel.cardImage),
          Positioned(child: Rating(rating: cardModel.cardRating ?? 0)),
        ],
      ),
    );
  }
}
