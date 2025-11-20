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
                    RouteName.detail,
                    extra: BaseCardModel(
                      cardId: item.id,
                      type: item.contentType.text,
                      cardTitle: item.title,
                      cardImage: item.imageUrl,
                      cardDate: item.date,
                      contentType: item.contentType,
                      horizontalCardImage: item.backGroundImage,
                    ),
                  );
                case ContentType.series:
                  context.pushNamed(
                    RouteName.detail,
                    extra: BaseCardModel(
                      cardId: item.id,
                      type: item.contentType.text,
                      cardTitle: item.title,
                      cardImage: item.imageUrl,
                      cardDate: item.date,
                      contentType: item.contentType,
                      horizontalCardImage: item.backGroundImage,
                    ),
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
                      seiresPosterPath: item.seasonPosterUrl,
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
                      posterImageUrl: item.seasonPosterUrl,
                      seasonPosterPath: item.imageUrl,
                      seasonName: item.title,
                      seasonDate: item.date,
                    ),
                  );
              }
            },
            child: CardImage(
              imageUrl: item.imageUrl,
              defaultImageUrl: item.seasonPosterUrl,
            ),
          ),
        ),
        CardTitleAndPopUpMenu(item: item, onRemove: onRemove),
      ],
    );
  }
}
