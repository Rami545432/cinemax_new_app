import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/series_details_models/season.dart';
import '../../../domain/entites/series_details_entity.dart';
import '../../../data/models/arguments/season_view_argument.dart';
import 'season_info_section.dart';

class SeasonTabBarView extends StatelessWidget {
  const SeasonTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.watch<SeriesDetailsEntity>();
    final List<Season> season = seriesDetailsEntity.season;
    return ListView.builder(
      itemCount: season.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              context.pushNamed(
                RouteName.season,
                extra: SeasonViewArgument(
                  contentType: ContentType.seasons,
                  id: seriesDetailsEntity.seiresId,
                  backDropImageUrl: seriesDetailsEntity.tvBackDropPath,
                  posterImageUrl: seriesDetailsEntity.posterImage,
                  seasonDate: season[index].airDate,
                  seasonName: season[index].name,
                  seasonNumber: season[index].seasonNumber,
                  seasonPosterPath: season[index].posterPath,
                  seasonRating: season[index].voteAverage,
                  specificId: season[index].id,
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
