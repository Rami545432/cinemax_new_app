import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';

class MiniCard extends StatelessWidget {
  final String image;

  const MiniCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) => Container(
    height: 250,
    width: 150,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: tmdbImageSize(TmdbImageSize.w300, image),
        fit: BoxFit.cover,
      ),
    ),
  );
}
