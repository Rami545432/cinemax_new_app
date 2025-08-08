import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/go_router.dart';
import '../../../../../series/data/models/series_details_model/season.dart';
import '../../../../../series/domain/entites/series_entity_details.dart';
import 'season_info_section.dart';
import 'season_view_argument.dart';

class SeasonTabBarView extends StatelessWidget {
  const SeasonTabBarView({super.key, required this.seriesDetailsEntity});

  final SeriesDetailsEntity seriesDetailsEntity;

  @override
  Widget build(BuildContext context) {
    final List<Season> season = seriesDetailsEntity.season;
    return ListView.builder(
      itemCount: season.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kSeasonView,
                extra: SeasonViewArgument(
                  id: seriesDetailsEntity.seiresId,
                  season: season[index],
                  packDropImageUrl: seriesDetailsEntity.tvBackDropPath,
                  posterImageUrl: seriesDetailsEntity.posterImage,
                ),
              );
            },
            child: SeasonInfoSection(
              season: season[index],
              defaultImageUrl: seriesDetailsEntity.posterImage!,
            ),
          ),
        );
      },
    );
  }
}
