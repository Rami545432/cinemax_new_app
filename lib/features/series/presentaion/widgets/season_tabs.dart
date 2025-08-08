import 'package:flutter/material.dart';

import '../../../home/presentaion/views_models/widgets/details_widgets/actor_info.dart';
import '../../domain/entites/series_season_details_entitiy.dart';
import 'episode_list_view_builder.dart';
import 'season_about_tab.dart';

class SeasonTabs extends StatelessWidget {
  const SeasonTabs({
    super.key,
    required this.data,
  });
  final SeriesSeasonDetailsEntitiy data;
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      EpisodesListViewBuilder(data: data),
      SeasonAboutTab(data: data),
      ActorInfo(actorList: data.seasonCredits?.cast ?? []),
    ]);
  }
}
