import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';

class MainListImage extends StatelessWidget {
  const MainListImage({super.key, required this.posterPath});
  final String posterPath;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageBuilder: (context, imageProvider) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: imageProvider, fit: .cover),
      ),
    ),
    imageUrl: tmdbImageSize(.w185, posterPath),
    width: 60,
    height: 80,
    fit: BoxFit.cover,
    errorWidget: (context, url, error) => Container(
      width: 60,
      height: 80,
      color: Colors.grey.withValues(alpha: 0.2),
      child: const Icon(Icons.broken_image, color: Colors.grey),
    ),
  );
}
