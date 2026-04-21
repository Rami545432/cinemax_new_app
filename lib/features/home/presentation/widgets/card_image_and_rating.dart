import 'package:cinemax_app_new/features/home/presentation/widgets/card_image.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 0.7,
    child: Stack(
      children: [
        CardImage(imageUrl: posterImage),
        Positioned(child: Rating(rating: rating)),
      ],
    ),
  );
}
