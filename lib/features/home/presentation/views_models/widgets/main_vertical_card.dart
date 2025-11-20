import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/simple_animated_card.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'card_image_and_rating.dart';
import 'card_title.dart';

class MainVerticalCard extends StatelessWidget {
  const MainVerticalCard({super.key, required this.cardModel, this.title});
  final BaseCardModel cardModel;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SimpleAnimatedCard(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            RouteName.detail,
            extra: cardModel,
            queryParameters: {'title': title},
          );
        },
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Hero(
                tag: '$title-${cardModel.cardId}',
                child: CardImageAndRating(cardModel: cardModel, title: title),
              ),
            ),
            Flexible(flex: 1, child: CardTitle(title: cardModel.cardTitle)),
          ],
        ),
      ),
    );
  }
}
