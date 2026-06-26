import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/empty_image.dart';

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
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final int cacheWidth = (150 * devicePixelRatio).round();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      memCacheWidth: cacheWidth,
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
            memCacheWidth: cacheWidth ~/ 2,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const _StaticPlaceholder(),
            errorWidget: (context, url, error) => const _StaticPlaceholder(),
          );
        }
        return const _StaticPlaceholder();
      },
      errorWidget: (context, url, error) {
        if (defaultImageUrl != null && defaultImageUrl!.isNotEmpty) {
          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: defaultImageUrl!,
            memCacheWidth: cacheWidth,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const _StaticPlaceholder(),
            errorWidget: (context, url, error) => const EmptyImage(),
          );
        }
        return const EmptyImage();
      },
    );
  }
}

class _StaticPlaceholder extends StatelessWidget {
  const _StaticPlaceholder();

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFF1E1E2C), // A sleek dark color for the loading state
  );
}
