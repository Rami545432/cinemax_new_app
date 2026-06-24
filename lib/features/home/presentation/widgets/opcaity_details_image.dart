import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_colors.dart';

class OpcaityDetailsImage extends StatelessWidget {
  const OpcaityDetailsImage({
    super.key,
    required this.detailsBackGroundImage,
    this.defaultDetailsBackGroundImage,
    this.imageSize = TmdbImageSize.original,
    this.memCacheWidth,
  });
  final String? detailsBackGroundImage;
  final String? defaultDetailsBackGroundImage;
  final TmdbImageSize imageSize;
  final int? memCacheWidth;
  @override
  Widget build(BuildContext context) => Container(
    foregroundDecoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, AppPrimaryColors.dark],
        stops: const [0.1, 1],
      ),
    ),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: tmdbImageSize(imageSize, detailsBackGroundImage ?? ''),
      memCacheWidth: memCacheWidth,
      errorWidget: (context, url, error) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: tmdbImageSize(imageSize, defaultDetailsBackGroundImage ?? ''),
        errorWidget: (context, url, error) =>
            Container(color: AppPrimaryColors.dark),
      ),
    ),
  );
}
