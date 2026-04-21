import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, this.defaultImageUrl, this.posterPath});

  final String? defaultImageUrl;
  final String? posterPath;
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: CachedNetworkImage(
      imageUrl: '${Constants.baseImageUrl}$posterPath',
      errorWidget: (context, url, error) => CachedNetworkImage(
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        imageUrl: '${Constants.baseImageUrl}$defaultImageUrl',
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
