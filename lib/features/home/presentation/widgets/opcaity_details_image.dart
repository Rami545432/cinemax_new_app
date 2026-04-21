import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OpcaityDetailsImage extends StatelessWidget {
  const OpcaityDetailsImage({
    super.key,
    required this.detailsBackGroundImage,
    this.defaultDetailsBackGroundImage,
  });
  final String? detailsBackGroundImage;
  final String? defaultDetailsBackGroundImage;

  @override
  Widget build(BuildContext context) => ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, AppPrimaryColors.dark],
      stops: const [0.1, 1],
    ).createShader(bounds),
    blendMode: BlendMode.dstOut,
    child: CachedNetworkImage(
      fit: BoxFit.cover,

      imageUrl: tmdbImageSize(
        TmdbImageSize.original,
        detailsBackGroundImage ?? '',
      ),
      errorWidget: (context, url, error) => CachedNetworkImage(
        fit: BoxFit.contain,

        imageUrl: tmdbImageSize(
          TmdbImageSize.original,
          defaultDetailsBackGroundImage ?? '',
        ),
        errorWidget: (context, url, error) =>
            Container(color: AppPrimaryColors.dark),
      ),
    ),
  );
}
