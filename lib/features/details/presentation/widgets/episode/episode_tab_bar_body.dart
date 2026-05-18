import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/episode.dart';
import 'package:movify/features/details/presentation/widgets/details_widgets/custom_descreption.dart';
import 'package:movify/features/details/presentation/widgets/episode/episode_actor_list_tile_builder.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_view_branch.dart';

class EpisodeTabBarBody extends StatelessWidget {
  const EpisodeTabBarBody({super.key, required this.episode});
  final Episode episode;

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const NeverScrollableScrollPhysics(),
    slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
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
              const Divider(),
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
