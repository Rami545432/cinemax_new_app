import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/actor_info.dart';
import '../../../domain/entites/series_season_details_entitiy.dart';
import '../episode/episode_list_view_builder.dart';
import 'season_about_tab.dart';

class SeasonTabs extends StatelessWidget {
  const SeasonTabs({super.key, required this.seiresPosterPath});
  final String seiresPosterPath;
  @override
  Widget build(BuildContext context) {
    final data = context.watch<SeriesSeasonDetailsEntitiy>();
    return TabBarView(
      children: [
        EpisodesListViewBuilder(data: data, seiresPosterPath: seiresPosterPath),
        SeasonAboutTab(),
        ActorInfo(actorList: data.seasonCredits?.cast ?? []),
      ],
    );
  }
}
