import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/rating.dart';

class SeeAllImageStack extends StatelessWidget {
  const SeeAllImageStack({
    super.key,
    required this.imageUrl,
    required this.rating,
  });

  final String imageUrl;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return const Icon(Icons.add_ic_call_outlined);
            },
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width * 0.27,
            imageUrl: '$baseImageUrl$imageUrl',
          ),
        ),
        Positioned(left: 45, top: 6, child: Rating(rating: rating)),
      ],
    );
  }
}
