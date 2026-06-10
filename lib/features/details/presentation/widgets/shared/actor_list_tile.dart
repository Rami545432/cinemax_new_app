import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';

class ActorListTile extends StatelessWidget {
  const ActorListTile({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        actorList.profilePath != null
            ? CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  tmdbImageSize(TmdbImageSize.w92, actorList.profilePath ?? ''),
                ),
              )
            : const CircleAvatar(child: Icon(Icons.person)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                actorList.name ?? 'Unknown',
                style: AppStyles.textStyle16(context),
              ),
              const SizedBox(height: 4),
              Text(
                actorList.character ?? 'Unknown Character',
                style: AppStyles.textStyle14(context),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
