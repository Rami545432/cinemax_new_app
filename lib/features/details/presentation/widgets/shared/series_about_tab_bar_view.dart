import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/series_details_entity.dart';
import 'about_tab_view_branch.dart';
import 'episode_to_air.dart';
import 'series_data_table.dart';
import 'trailers_image_list_view_builder.dart';

class SeriesAboutTabBarView extends StatelessWidget {
  const SeriesAboutTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.watch<SeriesDetailsEntity>();
    return Column(
      spacing: 20,
      children: [
        EpisodeToAir(
          baseEpisodeToAir: seriesDetailsEntity.lastEpisodeAir,
          imageUrl: seriesDetailsEntity.backgroundImage,
          title: 'Last Episode',
        ),
        EpisodeToAir(
          baseEpisodeToAir: seriesDetailsEntity.nextEpisodeAir,
          imageUrl: seriesDetailsEntity.backgroundImage,
          title: 'Next Episode',
        ),
        Divider(),
        AboutTabViewBranch(
          title: 'Informations',
          child: SeriesDataTable(seriesDetailsEntity: seriesDetailsEntity),
        ),
        Divider(),
        AboutTabViewBranch(
          title: 'Trailers',
          child: TrailersImageListViewBuilder(
            videos: seriesDetailsEntity.kVideos!,
          ),
        ),
      ],
    );
  }
}
