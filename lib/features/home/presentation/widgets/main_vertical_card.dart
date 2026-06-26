import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/widgets/shared/safe_hero_card.dart';
import 'package:movify/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:movify/features/home/presentation/widgets/card_image_and_rating.dart';
import 'package:movify/features/home/presentation/widgets/card_title.dart';
import 'package:movify/features/search/presentation/widgets/simple_animated_card.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class MainVerticalCard extends StatelessWidget {
  const MainVerticalCard({
    super.key,
    this.category,
    required this.cardData,
    this.enableHero = true,
    this.imageSize = TmdbImageSize.w300,
  });
  final String? category;
  final CardDisplayModel cardData;
  final bool enableHero;
  final TmdbImageSize imageSize;

  @override
  Widget build(BuildContext context) {
    final heroTag = '$category-${cardData.id}';
    final isMovie = (cardData.contentType == ContentType.movies);
    final routeName = isMovie ? RouteName.movieDetail : RouteName.tvDetail;
    return SimpleAnimatedCard(
      child: GestureDetector(
        onTap: () {
          // Precache the tiny placeholder for the details screen backdrop so it 
          // renders instantly without network delay during the Hero transition.
          final navData = cardData.toNavigationData();
          if (navData.backdropImage != null && navData.backdropImage!.isNotEmpty) {
            precacheImage(
              CachedNetworkImageProvider(
                tmdbImageSize(TmdbImageSize.w300, navData.backdropImage!),
              ),
              context,
            );
          }

          context.pushNamed(
            routeName,
            extra: navData,
            pathParameters: {'id': cardData.id.toString()},
            queryParameters: {'heroTag': heroTag},
          );
        },
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: enableHero
                  ? SafeHeroCard(
                      heroTag: heroTag,
                      child: CardImageAndRating(
                        posterImage: tmdbImageSize(
                          imageSize,
                          cardData.posterPath,
                        ),
                        rating: cardData.rating ?? 0,
                        title: category,
                      ),
                    )
                  : CardImageAndRating(
                      posterImage: tmdbImageSize(
                        imageSize,
                        cardData.posterPath,
                      ),
                      rating: cardData.rating ?? 0,
                      title: category,
                    ),
            ),
            Flexible(child: CardTitle(title: cardData.title)),
          ],
        ),
      ),
    );
  }
}
