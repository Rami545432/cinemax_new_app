import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/features/home/presentation/widgets/card_image.dart';

class SafeHeroCard extends StatelessWidget {
  const SafeHeroCard({
    super.key,
    required this.posterImage,
    required this.heroTag,
  });

  final String? posterImage;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final card = CardImage(
      imageUrl: tmdbImageSize(TmdbImageSize.w300, posterImage ?? ''),
      thumbnailUrl: tmdbImageSize(TmdbImageSize.w300, posterImage ?? ''),
    );

    // 1. Safe Tag Check: Do not render a Hero if the tag is null or empty.
    // An empty tag ('') can collide with other empty tags and crash the app.
    if (heroTag == null || heroTag!.isEmpty) {
      return card;
    }

    // 2. Safe Material Wrapper: Wrap the child in Material(transparency).
    // During a Hero flight, the widget moves to the overlay. If it lacks a
    // Material context, text will look yellow and ugly.
    return Hero(
      tag: heroTag!,
      child: Material(type: MaterialType.transparency, child: card),
    );
  }
}
