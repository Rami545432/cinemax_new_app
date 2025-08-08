import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/series_about_tab_bar_view.dart';
import 'package:flutter/material.dart';
import '../../../../../series/domain/entites/series_entity_details.dart';
import 'about_tab_bar_view.dart';
import 'actor_info.dart';
import 'recomended_tab_bar_view.dart';
import 'season_tab_bar_view.dart';

class SeriesDetailsCompoents extends StatelessWidget {
  const SeriesDetailsCompoents({super.key, required this.seriesDetailsEntity});
  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TabBarView(
        children: [
          AboutTabBarView(
            overview: seriesDetailsEntity.overView ?? '',
            geners: seriesDetailsEntity.geners ?? [],
            child: SeriesAboutTabBarView(
              seriesDetailsEntity: seriesDetailsEntity,
            ),
          ),
          SeasonTabBarView(seriesDetailsEntity: seriesDetailsEntity),
          ActorInfo(actorList: seriesDetailsEntity.actorDetails ?? []),
          RecomendedTabBarView(),
        ],
      ),
    );
  }
}
