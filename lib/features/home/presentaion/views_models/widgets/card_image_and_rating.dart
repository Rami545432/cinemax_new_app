import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/rating.dart';

class CardImageAndRating extends StatelessWidget {
  const CardImageAndRating({
    super.key,
    required this.imageUrl,
    required this.rating,
  });

  final String imageUrl;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.7,
      child: Stack(
        children: [
          CardImage(imageUrl: imageUrl),
          Positioned(child: Rating(rating: rating)),
        ],
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$baseImageUrl$imageUrl',
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
