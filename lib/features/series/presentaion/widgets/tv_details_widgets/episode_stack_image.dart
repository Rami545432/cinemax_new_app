import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/rating.dart';

class EpisodeStackImage extends StatelessWidget {
  const EpisodeStackImage({
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
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
              width: 121, height: 83, imageUrl: '$baseImageUrl$imageUrl'),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.height * 0.02,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle,
              size: 30,
            ),
          ),
        ),
        Rating(rating: rating),
      ],
    );
  }
}
