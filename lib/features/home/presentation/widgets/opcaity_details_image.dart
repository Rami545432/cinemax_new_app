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
      ),
    ),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: tmdbImageSize(imageSize, detailsBackGroundImage ?? ''),
      memCacheWidth: memCacheWidth,
      // Progressive loading: The w300 version downloads instantly (or is already cached),
      // giving a smooth transition while the massive version decodes.
      placeholder: (context, url) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: tmdbImageSize(TmdbImageSize.w300, detailsBackGroundImage ?? ''),
        placeholder: (context, url) => Container(color: AppPrimaryColors.dark),
        errorWidget: (context, url, error) => Container(color: AppPrimaryColors.dark),
      ),
      errorWidget: (context, url, error) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: tmdbImageSize(imageSize, defaultDetailsBackGroundImage ?? ''),
        placeholder: (context, url) => CachedNetworkImage(
           fit: BoxFit.cover,
           imageUrl: tmdbImageSize(TmdbImageSize.w300, defaultDetailsBackGroundImage ?? ''),
           placeholder: (context, url) => Container(color: AppPrimaryColors.dark),
           errorWidget: (context, url, error) => Container(color: AppPrimaryColors.dark),
        ),
        errorWidget: (context, url, error) =>
            Container(color: AppPrimaryColors.dark),
      ),
    ),
  );
}
