import 'package:cinemax_app_new/core/utils/helper/adaptive_layout_widget.dart';
import 'package:cinemax_app_new/core/utils/mobile_play_button.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:cinemax_app_new/core/utils/tablet_play_button.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';

import 'details_date_and_time_section.dart';
import 'details_image.dart';

class MovieDetailsBodySectionTwo extends StatelessWidget {
  const MovieDetailsBodySectionTwo({
    super.key,
    required this.cardModel,
    this.title,
  });

  final BaseCardModel cardModel;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Row(
      spacing: 20,
      children: [
        Expanded(
          flex: 1,
          child: Hero(
            tag: '$title-${cardModel.cardId}',
            child: DetailsImage(posterPath: cardModel.cardImage),
          ),
        ),
        Expanded(
          flex: width > SizeConfig.mobile ? 2 : 1,
          child: Column(
            spacing: 20,
            children: [
              DetailsDateAndTimeSection(cardModel: cardModel),
              AdaptiveLayoutWidget(
                mobile: (context) => MobilePlayButton(
                  type: cardModel.type ?? 'movie',
                  id: cardModel.cardId.toString(),
                  title: cardModel.cardTitle,
                ),
                desktop: (context) => SizedBox(),
                tablet: (context) => TabletPlayButton(
                  type: cardModel.type ?? 'movie',
                  id: cardModel.cardId.toString(),
                  title: cardModel.cardTitle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
