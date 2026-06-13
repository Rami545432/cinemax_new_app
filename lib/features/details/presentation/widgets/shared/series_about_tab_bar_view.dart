import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/details/domain/entites/series_details_entity.dart';
import 'package:movify/features/details/presentation/extensions/episode_to_air_extension.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_view_branch.dart';
import 'package:movify/features/details/presentation/widgets/shared/episode_to_air.dart';
import 'package:movify/features/details/presentation/widgets/shared/series_data_table.dart';
import 'package:movify/features/details/presentation/widgets/shared/trailers_image_list_view_builder.dart';

class SeriesAboutTabBarView extends StatelessWidget {
  const SeriesAboutTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.read<SeriesDetailsEntity>();
    return Column(
      spacing: 20,
      children: [
        EpisodeToAir(
          episodeToAirModel: seriesDetailsEntity.lastEpisodeAir
              ?.toEpisodeToAirModel(),
          imageUrl: seriesDetailsEntity.backgroundImage,
          title: 'Last Episode',
        ),
        EpisodeToAir(
          episodeToAirModel: seriesDetailsEntity.nextEpisodeAir
              ?.toEpisodeToAirModel(),
          imageUrl: seriesDetailsEntity.backgroundImage,
          title: 'Next Episode',
        ),
        const Divider(),
        AboutTabViewBranch(
          title: 'Informations',
          child: SeriesDataTable(seriesDetailsEntity: seriesDetailsEntity),
        ),
        const Divider(),
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
