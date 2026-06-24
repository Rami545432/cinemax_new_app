import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/models/episode_to_air_model.dart';
import 'package:movify/features/details/presentation/widgets/shared/episode_image_and_details.dart';

class EpisodeToAir extends StatelessWidget {
  const EpisodeToAir({
    super.key,
    required this.episodeToAirModel,
    required this.imageUrl,
    required this.title,
  });
  final EpisodeToAirModel? episodeToAirModel;
  final String? imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (episodeToAirModel == null) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.episode,
          extra: EpisodeNavData(
            tmdbId: episodeToAirModel?.showId ?? 0,
            seasonNumber: episodeToAirModel!.seasonNumber!,
            episodeNumber: episodeToAirModel!.episodeNumber!,
            rating: episodeToAirModel!.voteAverage,
            posterImage: imageUrl!,
            specificId: episodeToAirModel?.id ?? 0,
          ),
        );
      },
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '', style: AppStyles.textStyle18(context)),
          EpisodeImageAndDetails(
            episodeToAirModel: episodeToAirModel!,
            imageUrl: imageUrl ?? '',
          ),
        ],
      ),
    );
  }
}
