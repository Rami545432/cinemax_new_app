import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, this.defaultImageUrl, this.posterPath});

  final String? defaultImageUrl;
  final String? posterPath;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: '$baseImageUrl$posterPath',
        errorWidget: (context, url, error) => CachedNetworkImage(
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          imageUrl: '$baseImageUrl$defaultImageUrl',
          errorWidget: (context, url, error) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}
