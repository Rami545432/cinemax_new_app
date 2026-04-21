import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/presentation/widgets/favorite_button.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/simple_animated_card.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            children: [
              // Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: enableHero
                    ? Hero(tag: heroTag, child: _buildImage())
                    : _buildImage(),
              ),
              const SizedBox(width: 16),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardData.title,
                      style: AppStyles.textStyle16(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: AppStyles.textStyle14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Play/Action Button
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8),
                padding: const EdgeInsets.all(8),

                child: FavoriteButton(
                  favoriteEntity: FavoriteEntity(
                    tmbdId: cardData.id,
                    title: cardData.title,
                    posterImage: cardData.posterPath,
                    contentType: cardData.contentType,
                    date: cardData.date ?? '_',
                    rating: cardData.rating ?? 0.0,
                    specificId: cardData.id,
                    backdropImage: cardData.backdropPath ?? '',
                    genres: cardData.genreIds ?? [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() => CachedNetworkImage(
    imageUrl: tmdbImageSize(.w300, cardData.posterPath),
    width: 60,
    height: 80,
    fit: BoxFit.cover,
    errorWidget: (context, url, error) => Container(
      width: 60,
      height: 80,
      color: Colors.grey.withValues(alpha: 0.2),
      child: const Icon(Icons.broken_image, color: Colors.grey),
    ),
  );
}
