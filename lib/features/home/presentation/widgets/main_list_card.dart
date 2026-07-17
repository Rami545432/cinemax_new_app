import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/widgets/shared/safe_hero_card.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:movify/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:movify/features/home/presentation/widgets/main_list_card_metadata.dart';
import 'package:movify/features/home/presentation/widgets/main_list_image.dart';
import 'package:movify/features/search/presentation/widgets/simple_animated_card.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class MainListCard extends StatelessWidget {
  const MainListCard({
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
    final heroTag = '$category-${cardData.id}-list';
    final isMovie = (cardData.contentType == ContentType.movies);
    final routeName = isMovie ? RouteName.movieDetail : RouteName.tvDetail;

    final releaseYear = cardData.date != null && cardData.date!.length >= 4
        ? cardData.date!.substring(0, 4)
        : '';
    final rating = cardData.rating != null
        ? cardData.rating!.toStringAsFixed(1)
        : 'NR';
    final subtitle =
        '⭐ $rating ${releaseYear.isNotEmpty ? " • $releaseYear" : ""}';
    final favoriteEntity = FavoriteEntity(
      tmbdId: cardData.id,
      title: cardData.title,
      posterImage: cardData.posterPath,
      contentType: cardData.contentType,
      date: cardData.date ?? '_',
      rating: cardData.rating ?? 0.0,
      specificId: cardData.id,
      backdropImage: cardData.backdropPath ?? '',
      genres: cardData.genreIds ?? [],
    );

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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            spacing: 16,
            children: [
              // Poster
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: enableHero
                    ? SafeHeroCard(
                        heroTag: heroTag,
                        child: MainListImage(posterPath: cardData.posterPath),
                      )
                    : MainListImage(posterPath: cardData.posterPath),
              ),

              // Text Content
              Expanded(
                child: MainListCardMetaData(
                  title: cardData.title,
                  subtitle: subtitle,
                ),
              ),
              // Play/Action Button
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8),
                padding: const EdgeInsets.all(8),

                child: FavoriteButton(favoriteEntity: favoriteEntity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
