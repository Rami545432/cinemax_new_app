import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/views_models/widgets/card_image.dart';
import '../../../details/data/models/arguments/episode_view_argument.dart';
import '../../../details/data/models/arguments/season_view_argument.dart';

import 'card_title_and_popup_menu.dart';

class FavoriteVerticalCard extends StatelessWidget {
  const FavoriteVerticalCard({
    super.key,
    required this.item,
    required this.onRemove,
  });
  final FavoriteEntity item;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              switch (item.contentType) {
                case ContentType.movies:
                  context.pushNamed(
                    RouteName.movieDetail,
                    pathParameters: {'id': item.id.toString()},
                    queryParameters: {
                      'heroTag': 'favorite-${item.id}',
                      'posterImage': item.posterImage,
                    },
                  );
                case ContentType.series:
                  context.pushNamed(
                    RouteName.tvDetail,
                    pathParameters: {'id': item.id.toString()},
                    queryParameters: {
                      'heroTag': 'favorite-${item.id}',
                      'posterImage': item.posterImage,
                    },
                  );
                case ContentType.episodes:
                  context.pushNamed(
                    RouteName.episode,
                    extra: EpisodeViewArgument(
                      seasonNumber: item.seasonNumber,
                      episodeNumber: item.episodeNumber,
                      tvid: item.id,
                      contentType: item.contentType,
                      seasonPosterPath: item.backGroundImage,
                      seiresPosterPath: item.posterImage,
                    ),
                  );
                case ContentType.seasons:
                  context.pushNamed(
                    RouteName.season,
                    extra: SeasonViewArgument(
                      id: item.id,
                      seasonNumber: item.seasonNumber,
                      contentType: item.contentType,
                      specificId: item.specificId,
                      backDropImageUrl: item.backGroundImage,
                      posterImageUrl: item.posterImage,
                      seasonPosterPath: item.posterImage,
                      seasonName: item.title,
                      seasonDate: item.date,
                    ),
                  );
              }
            },
            child: CardImage(
              imageUrl: tmdbImageSize(TmdbImageSize.w300, item.posterImage),
              defaultImageUrl: tmdbImageSize(
                TmdbImageSize.w300,
                item.backGroundImage,
              ),
            ),
          ),
        ),
        CardTitleAndPopUpMenu(item: item, onRemove: onRemove),
      ],
    );
  }
}
