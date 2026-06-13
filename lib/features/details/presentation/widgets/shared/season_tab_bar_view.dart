import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/details/domain/entites/series_details_entity.dart';
import 'package:movify/features/details/domain/value_objects/season.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/widgets/shared/season_info_section.dart';

class SeasonTabBarView extends StatelessWidget {
  const SeasonTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.read<SeriesDetailsEntity>();
    final List<Season> season = seriesDetailsEntity.season;

    return ListView.builder(
      itemCount: season.length,
      itemBuilder: (context, index) {
        final heroTag = '${seriesDetailsEntity.seiresId}-${season[index].id}';
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
            child: SeasonInfoSection(
              heroTag: heroTag,
              season: season[index],
              defaultImageUrl: seriesDetailsEntity.posterImage!,
            ),
          ),
        );
      },
    );
  }
}
