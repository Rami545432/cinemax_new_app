import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../data/models/shared_details_models/cast.dart';

class ActorListTile extends StatelessWidget {
  const ActorListTile({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: actorList.profilePath != null
          ? CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                tmdbImageSize(TmdbImageSize.w185, actorList.profilePath ?? ''),
              ),
            )
          : const CircleAvatar(child: Icon(Icons.person)),
      title: Text(
        actorList.name ?? 'Unknown',
        style: AppStyles.textStyle16(context),
      ),
      subtitle: Text(
        actorList.character ?? 'Unknown Character',
        style: AppStyles.textStyle14(context),
      ),
    );
  }
}
