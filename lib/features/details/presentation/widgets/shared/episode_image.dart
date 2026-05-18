import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/constant.dart';
import 'package:movify/core/utils/app_colors.dart';

class EpisodeImage extends StatelessWidget {
  const EpisodeImage({super.key, required this.episodeImageUrl});

  final String? episodeImageUrl;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: CachedNetworkImage(
      imageUrl: '${Constants.baseImageUrl}$episodeImageUrl',
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
