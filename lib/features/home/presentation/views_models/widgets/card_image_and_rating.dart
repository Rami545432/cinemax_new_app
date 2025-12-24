import 'package:cinemax_app_new/core/utils/rating.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageAndRating extends StatelessWidget {
  const CardImageAndRating({
    super.key,
    required this.posterImage,
    required this.rating,
    this.title,
  });
  final String? title;
  final String posterImage;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: Stack(
        children: [
          CardImage(imageUrl: posterImage),
          Positioned(child: Rating(rating: rating)),
        ],
      ),
    );
  }
}
