import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';

class ActorAvatar extends StatelessWidget {
  const ActorAvatar({super.key, required this.profilePath});

  final String profilePath;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    backgroundImage: CachedNetworkImageProvider(
      tmdbImageSize(TmdbImageSize.w92, profilePath),
    ),
  );
}
