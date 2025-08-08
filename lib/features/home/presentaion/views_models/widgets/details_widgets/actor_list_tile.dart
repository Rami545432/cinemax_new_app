import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../models/movie_details_model/cast.dart';

class ActorListTile extends StatelessWidget {
  const ActorListTile({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: actorList.profilePath != null
          ? CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                'https://image.tmdb.org/t/p/w200${actorList.profilePath}',
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
