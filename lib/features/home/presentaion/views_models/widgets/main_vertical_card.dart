import 'package:cinemax_app_new/core/utils/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../models/base_card_model.dart';
import '../../../../search/presentaion/view_models/widgets/simple_animated_card.dart';
import 'card_image_and_rating.dart';
import 'card_title.dart';

class MainVerticalCard extends StatelessWidget {
  const MainVerticalCard({super.key, required this.cardModel});
  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return SimpleAnimatedCard(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(
            context,
          ).push(AppRouter.kMovieDetailView, extra: cardModel);
        },
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: CardImageAndRating(
                imageUrl: cardModel.cardImage,
                rating: cardModel.cardRating ?? 0,
              ),
            ),
            Flexible(flex: 1, child: CardTitle(title: cardModel.cardTitle)),
          ],
        ),
      ),
    );
  }
}
