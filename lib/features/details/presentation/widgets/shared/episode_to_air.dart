import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/arguments/episode_view_argument.dart';
import '../../../data/models/series_details_models/base_episode_to_air.dart';
import 'episode_image_and_details.dart';

class EpisodeToAir extends StatelessWidget {
  const EpisodeToAir({
    super.key,
    required this.baseEpisodeToAir,
    required this.imageUrl,
    required this.title,
  });
  final BaseEpisodeToAir? baseEpisodeToAir;
  final String? imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (baseEpisodeToAir == null) {
      return const SizedBox();
    }

    return _buildEpisodeToAir(context);
  }

  Widget _buildEpisodeToAir(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.episode,
          extra: EpisodeViewArgument(
            contentType: ContentType.episodes,
            episodeNumber: baseEpisodeToAir!.episodeNumber!,
            seasonNumber: baseEpisodeToAir!.seasonNumber!,
            tvid: baseEpisodeToAir!.showId!,
            seasonPosterPath: imageUrl ?? '',
          ),
        );
      },
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '', style: AppStyles.textStyle18(context)),
          EpisodeImageAndDetails(
            baseEpisodeToAir: baseEpisodeToAir!,
            imageUrl: imageUrl ?? '',
          ),
        ],
      ),
    );
  }
}
