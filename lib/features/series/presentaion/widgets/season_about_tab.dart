import 'package:flutter/material.dart';

import '../../../../core/utils/details_widgets/custom_descreption.dart';
import '../../../home/presentaion/views_models/widgets/details_widgets/about_tab_view_branch.dart';
import '../../../home/presentaion/views_models/widgets/details_widgets/trailers_image_list_view_builder.dart';
import '../../domain/entites/series_season_details_entitiy.dart';
import 'season_data_table.dart';

class SeasonAboutTab extends StatelessWidget {
  const SeasonAboutTab({
    super.key,
    required this.data,
  });

  final SeriesSeasonDetailsEntitiy data;

  @override
  Widget build(BuildContext context) {
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
                child: SeasonDataTable(
                  data: data,
                ),
              ),
              Divider(),
              AboutTabViewBranch(
                title: 'Trailers',
                child: TrailersImageListViewBuilder(
                  videoKey:
                      data.seasonVideos?.results?.map((e) => e.key).toList() ??
                          [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
