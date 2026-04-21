import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/presentation/core/details_data_navigation.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/card_title_and_popup_menu.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteVerticalCard extends StatelessWidget {
  const FavoriteVerticalCard({
    super.key,
    required this.item,
    required this.onRemove,
  });
  final FavoriteEntity item;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) => Column(
    spacing: 10,
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            switch (item.contentType) {
              case ContentType.movies:
                context.pushNamed(
                  RouteName.movieDetail,
                  pathParameters: {'id': item.specificId.toString()},
                  extra: MovieNavData(
                    tmdbId: item.specificId,
                    posterImage: item.posterImage,
                    backdropImage: item.backdropImage,
                    title: item.title,
                    date: item.date,
                    rating: item.rating,
                    specificId: item.tmbdId,
                  ),
                );
              case ContentType.series:
                context.pushNamed(
                  RouteName.tvDetail,
                  pathParameters: {'id': item.specificId.toString()},
                  extra: SeriesNavData(
                    tmdbId: item.specificId,
                    posterImage: item.posterImage,
                    backdropImage: item.backdropImage,
                    title: item.title,
                    date: item.date,
                    rating: item.rating,
                    specificId: item.tmbdId,
                  ),
                );
              case ContentType.episodes:
                context.pushNamed(
                  RouteName.episode,
                  extra: EpisodeNavData(
                    tmdbId: item.tmbdId,
                    seasonNumber: item.seasonNumber,
                    episodeNumber: item.episodeNumber,
                    posterImage: item.posterImage,
                    backdropImage: item.backdropImage,
                    seriesPosterPath: item.posterImage,
                    rating: item.rating,
                    specificId: item.specificId,
                  ),
                );
              case ContentType.seasons:
                context.pushNamed(
                  RouteName.season,
                  extra: SeasonNavData(
                    tmdbId: item.tmbdId,
                    seasonNumber: item.seasonNumber,
                    posterImage: item.posterImage,
                    backdropImage: item.backdropImage,
                    seasonName: item.title,
                    date: item.date,
                    rating: item.rating,
                    specificId: item.specificId,
                  ),
                );
            }
          },
          child: CardImage(
            imageUrl: tmdbImageSize(TmdbImageSize.w300, item.posterImage),
            defaultImageUrl: tmdbImageSize(
              TmdbImageSize.w300,
              item.backdropImage,
            ),
          ),
        ),
      ),
      CardTitleAndPopUpMenu(item: item, onRemove: onRemove),
    ],
  );
}
