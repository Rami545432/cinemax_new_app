import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';

import '../../../data/models/shared_details_models/cast.dart';

class ActorImage extends StatelessWidget {
  const ActorImage({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(48),
      child: CachedNetworkImage(
        imageUrl: '$baseImageUrl${actorList.profilePath ?? ''}',
        width: 70,
        height: 70,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
