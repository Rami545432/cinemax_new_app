import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class OpcaityDetailsImage extends StatelessWidget {
  const OpcaityDetailsImage({
    super.key,
    required this.detailsBackGroundImage,
    this.defaultDetailsBackGroundImage,
  });
  final String? detailsBackGroundImage;
  final String? defaultDetailsBackGroundImage;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppPrimaryColors.dark],
          stops: [0.1, 1],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        imageUrl: '$baseImageUrl$detailsBackGroundImage',
        errorWidget: (context, url, error) => CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: '$baseImageUrl$defaultDetailsBackGroundImage',
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
