import 'package:flutter/material.dart';

import '../../../../../../core/utils/helper/adaptive_layout_widget.dart';
import '../../../../../../core/utils/mobile_play_button.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/utils/tablet_play_button.dart';
import '../../../../../../models/base_card_model.dart';
import 'details_date_and_time_section.dart';
import 'details_image.dart';

class MovieDetailsBodySectionTwo extends StatelessWidget {
  const MovieDetailsBodySectionTwo({super.key, required this.cardModel});

  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      spacing: 20,
      children: [
        Expanded(flex: 1, child: DetailsImage(imageUrl: cardModel.cardImage)),
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
