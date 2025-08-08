import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/utils/helper/formatted_date_method.dart';

class AboutEpisodeComponets extends StatelessWidget {
  const AboutEpisodeComponets({
    super.key,
    required this.image,
    required this.name,
    required this.episodeNumber,
    required this.seasonNumber,
    required this.airDate,
  });

  final String image;
  final String name;
  final num episodeNumber;
  final num seasonNumber;
  final String airDate;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(imageUrl: '$baseImageUrl$image'),
          ),
          Column(
            children: [
              Text(name),
              Row(
                children: [
                  Text('S$episodeNumber/E$seasonNumber  .'),
                  Text(formatDateMonthYear(airDate))
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ]);
  }
}
