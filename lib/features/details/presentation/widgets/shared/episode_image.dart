import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_colors.dart';

class EpisodeImage extends StatelessWidget {
  const EpisodeImage({
    super.key,
    required this.episodeImageUrl,
    this.imageSize = TmdbImageSize.w300,
  });

  final String? episodeImageUrl;
  final TmdbImageSize imageSize;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: CachedNetworkImage(
      imageUrl: tmdbImageSize(imageSize, episodeImageUrl ?? ''),
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: AppPrimaryColors.blueAccent),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );
}
