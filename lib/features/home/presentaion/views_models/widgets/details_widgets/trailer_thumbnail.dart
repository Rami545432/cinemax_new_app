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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: 'https://img.youtube.com/vi/$videoKey/maxresdefault.jpg',
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
