import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../card_image.dart';
import 'horizontal_column_texts.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key, required this.cardModel});
  final BaseCardModel cardModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.detail, extra: cardModel);
      },
      child: AspectRatio(
        aspectRatio: width > SizeConfig.mobile ? 2.1 : 1.8,
        child: Stack(
          children: [
            CardImage(imageUrl: cardModel.horizontalCardImage ?? ''),
            Positioned(
              bottom: 0,
              left: 5,
              child: HorizontalColumnTexts(cardModel: cardModel),
            ),
          ],
        ),
      ),
    );
  }
}
