import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FilmCastInfo extends StatelessWidget {
  const FilmCastInfo({
    super.key,
    required this.actorName,
    required this.actorImage,
  });
  final String actorName, actorImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return const Icon(Icons.cancel_rounded);
              },
              imageUrl: '$baseImageUrl$actorImage',
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              actorName,
              style: AppStyles.textStyle14(
                context,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Acting', style: AppStyles.textStyle12(context)),
          ],
        ),
      ],
    );
  }
}
