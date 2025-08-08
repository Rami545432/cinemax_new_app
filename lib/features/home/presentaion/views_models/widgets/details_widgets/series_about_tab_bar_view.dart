import 'package:flutter/material.dart';

import '../../../../../series/domain/entites/series_entity_details.dart';
import 'about_tab_view_branch.dart';
import 'episode_to_air.dart';
import 'series_data_table_bloc_builder.dart';
import 'trailers_image_list_view_builder.dart';

class SeriesAboutTabBarView extends StatelessWidget {
  const SeriesAboutTabBarView({super.key, required this.seriesDetailsEntity});

  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        EpisodeToAir(
          baseEpisodeToAir: seriesDetailsEntity.lastEpisodeAir,
          imageUrl: seriesDetailsEntity.tvBackDropPath,
          title: 'Last Episode',
        ),
        EpisodeToAir(
          baseEpisodeToAir: seriesDetailsEntity.nextEpisodeAir,
          imageUrl: seriesDetailsEntity.tvBackDropPath,
          title: 'Next Episode',
        ),
        Divider(),
        AboutTabViewBranch(
          title: 'Informations',
          child: SeriesDataTableBlocBuilder(
            seriesDetailsEntity: seriesDetailsEntity,
          ),
        ),
        Divider(),
        AboutTabViewBranch(
          title: 'Trailers',
          child: TrailersImageListViewBuilder(
            videoKey: seriesDetailsEntity.kVideos!.results!
                .map((e) => e.key)
                .toList(),
          ),
        ),
      ],
    );
  }
}
