import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/details_widgets/custom_descreption.dart';
import 'package:flutter/material.dart';

import '../shared/about_tab_view_branch.dart';
import '../../../data/models/series_season_details/episode.dart';
import 'episode_actor_list_tile_builder.dart';

class EpisodeTabBarBody extends StatelessWidget {
  const EpisodeTabBarBody({super.key, required this.episode});
  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                if (episode.overview != null) ...[
                  CustomDescreption(overview: episode.overview!),
                ],

                if (episode.runtime != null) ...[
                  AboutTabViewBranch(
                    title: 'Runtime',
                    child: Text(
                      '${episode.runtime} minutes',
                      style: AppStyles.textStyle16(context),
                    ),
                  ),
                ],
                Divider(),
                // Guest Stars Section
                if (episode.guestStars?.isNotEmpty ?? false) ...[
                  AboutTabViewBranch(
                    title: 'Guest Stars',
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: EpisodeActrolListTileListViewBuilder(
                        episode: episode,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
