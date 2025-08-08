import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../constant.dart';
import '../../../../../series/data/models/series_details_model/season.dart';

class SeasonImage extends StatelessWidget {
  const SeasonImage({super.key, required this.season});

  final Season season;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: '$baseImageUrl${season.posterPath}',
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error_outline_rounded),
      ),
    );
  }
}
