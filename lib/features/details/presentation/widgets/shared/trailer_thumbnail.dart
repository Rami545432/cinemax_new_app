import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrailerThumbnail extends StatelessWidget {
  const TrailerThumbnail({
    super.key,
    required this.videoKey,
    required this.onTap,
  });

  final String videoKey;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Align(
        heightFactor: 0.75,
        child: CachedNetworkImage(
          imageUrl: 'https://img.youtube.com/vi/$videoKey/hqdefault.jpg',
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}
