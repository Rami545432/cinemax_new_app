import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/empty_image.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.imageUrl,
    this.defaultImageUrl,
    this.thumbnailUrl,
  });

  final String imageUrl;
  final String? defaultImageUrl;
  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) {
      if (thumbnailUrl != null && thumbnailUrl!.isNotEmpty) {
        return CachedNetworkImage(
          imageUrl: thumbnailUrl!,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: CircularProgressIndicator()),
        );
      }
      return const Center(child: CircularProgressIndicator());
    },
    errorWidget: (context, url, error) => CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: defaultImageUrl ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const EmptyImage(),
    ),
  );
}
