import 'package:cinemax_app_new/config/animations/widgets/animated_list_item.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/season.dart';
import 'package:cinemax_app_new/features/details/presentation/core/details_data_navigation.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/season_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SeasonTabBarView extends StatelessWidget {
  const SeasonTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.watch<SeriesDetailsEntity>();
    final List<Season> season = seriesDetailsEntity.season;

    return ListView.builder(
      itemCount: season.length,
      itemBuilder: (context, index) {
        final heroTag = '$seriesDetailsEntity.seiresId-${season[index].id}';
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              final item = season[index];
              context.pushNamed(
                RouteName.season,
                extra: SeasonNavData(
                  tmdbId: seriesDetailsEntity.seiresId,
                  seasonNumber: item.seasonNumber ?? 0,
                  posterImage: item.posterPath ?? '',
                  backdropImage: seriesDetailsEntity.backgroundImage ?? '',
                  seasonName: item.name ?? '',
                  date: item.airDate ?? '',
                  rating: item.voteAverage ?? 0,
                  specificId: item.id ?? 0,
                ),
                queryParameters: {'heroTag': heroTag},
              );
            },
            child: AnimatedListItem(
              index: index,
              child: SeasonInfoSection(
                heroTag: heroTag,
                season: season[index],
                defaultImageUrl: seriesDetailsEntity.posterImage!,
              ),
            ),
          ),
        );
      },
    );
  }
}
