import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OpcaityDetailsImage extends StatelessWidget {
  const OpcaityDetailsImage({super.key, required this.imageUrl});
  final String? imageUrl;

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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider('$baseImageUrl$imageUrl'),
          ),
        ),
      ),
    );
  }
}
