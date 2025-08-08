import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../constant.dart';

class EpisodeImage extends StatelessWidget {
  const EpisodeImage({super.key, required this.episodeImageUrl, this.imageUrl});

  final String? episodeImageUrl, imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: '$baseImageUrl$episodeImageUrl',
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => ClipRRect(
          child: CachedNetworkImage(
            imageUrl: '$baseImageUrl$imageUrl',
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
