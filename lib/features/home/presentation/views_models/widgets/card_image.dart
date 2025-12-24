import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.imageUrl, this.defaultImageUrl});

  final String imageUrl;
  final String? defaultImageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),

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
        errorWidget: (context, url, error) {
          return Center(child: const Icon(Icons.error_outline_rounded));
        },
      ),
    );
  }
}
