import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/simple_animated_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'card_image_and_rating.dart';
import 'card_title.dart';

class MainVerticalCard extends StatelessWidget {
  const MainVerticalCard({
    super.key,
    required this.category,
    required this.posterImage,
    required this.title,
    required this.rating,
    required this.id,
    required this.type,
  });
  final String? category;
  final String posterImage;
  final String title;
  final num rating;
  final int id;
  final String? type;

  @override
  Widget build(BuildContext context) {
    final heroTag = '$category-$id';
    final isMovie = type == 'movie' ? true : false;
    final routeName = isMovie ? RouteName.movieDetail : RouteName.tvDetail;
    return SimpleAnimatedCard(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            routeName,
            pathParameters: {'id': id.toString()},
            queryParameters: {'heroTag': heroTag, 'posterImage': posterImage},
          );
        },
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Hero(
                tag: heroTag,
                child: CardImageAndRating(
                  posterImage: posterImage,
                  rating: rating,
                  title: category,
                ),
              ),
            ),
            Flexible(flex: 1, child: CardTitle(title: title)),
          ],
        ),
      ),
    );
  }
}

bool _isOnDetails(BuildContext context) {
  final location = GoRouterState.of(context).uri.path;
  return location.startsWith('/movie/') || location.startsWith('/tv/');
}

void navigateToDetails({
  required BuildContext context,
  required int id,
  required bool isMovie,
  required String heroTag,
}) {
  final routeName = isMovie ? RouteName.movieDetail : RouteName.tvDetail;

  if (_isOnDetails(context)) {
    // Facebook-style: replace
    context.goNamed(
      routeName,
      pathParameters: {'id': id.toString()},
      queryParameters: {'heroTag': heroTag},
    );
  } else {
    // First entry: preserve home
    context.pushNamed(
      routeName,
      pathParameters: {'id': id.toString()},
      queryParameters: {'heroTag': heroTag},
    );
  }
}
