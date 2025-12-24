import 'package:cinemax_app_new/features/details/presentation/widgets/details_widgets/custom_descreption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/about_tab_view_branch.dart';
import '../shared/trailers_image_list_view_builder.dart';
import '../../../domain/entites/series_season_details_entitiy.dart';
import 'season_data_table.dart';

class SeasonAboutTab extends StatelessWidget {
  const SeasonAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<SeriesSeasonDetailsEntitiy>();
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            spacing: 50,
            children: [
              SizedBox(),
              CustomDescreption(overview: data.seasonOverView),
              Divider(),
              AboutTabViewBranch(
                title: 'Information',
                child: SeasonDataTable(data: data),
              ),
              Divider(),
              AboutTabViewBranch(
                title: 'Trailers',
                child: TrailersImageListViewBuilder(videos: data.seasonVideos!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
