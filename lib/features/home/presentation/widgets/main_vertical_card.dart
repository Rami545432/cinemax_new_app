import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/enums/content_type.dart';
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
  });
  final String? category;
  final CardDisplayModel cardData;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final heroTag = '$category-${cardData.id}';
    final isMovie = (cardData.contentType == ContentType.movies);
    final routeName = isMovie ? RouteName.movieDetail : RouteName.tvDetail;
    return SimpleAnimatedCard(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            routeName,
            extra: cardData.toNavigationData(),
            pathParameters: {'id': cardData.id.toString()},
            queryParameters: {'heroTag': heroTag},
          );
        },
        child: Column(
          spacing: 12,
          crossAxisAlignment: .start,
          children: [
            Flexible(
              flex: 5,
              child: enableHero
                  ? Hero(
                      tag: heroTag,
                      child: CardImageAndRating(
                        posterImage: tmdbImageSize(.w300, cardData.posterPath),
                        rating: cardData.rating ?? 0,
                        title: category,
                      ),
                    )
                  : CardImageAndRating(
                      posterImage: tmdbImageSize(.w300, cardData.posterPath),
                      rating: cardData.rating ?? 0,
                      title: category,
                    ),
            ),
            CardTitle(title: cardData.title),
          ],
        ),
      ),
    );
  }
}
