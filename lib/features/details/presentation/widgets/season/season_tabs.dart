import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/presentation/widgets/episode/episode_list_view_builder.dart';
import 'package:movify/features/details/presentation/widgets/season/season_about_tab.dart';
import 'package:movify/features/details/presentation/widgets/shared/cast_tab_bar_view.dart';

class SeasonTabs extends StatelessWidget {
  const SeasonTabs({super.key, required this.seiresPosterPath});
  final String seiresPosterPath;
  @override
  Widget build(BuildContext context) {
    final data = context.watch<SeriesSeasonDetailsEntity>();
    return TabBarView(
      children: [
        EpisodesListViewBuilder(data: data, seiresPosterPath: seiresPosterPath),
        const SeasonAboutTab(),
        CastTabBarView(actorList: data.seasonCredits?.cast ?? []),
      ],
    );
  }
}
