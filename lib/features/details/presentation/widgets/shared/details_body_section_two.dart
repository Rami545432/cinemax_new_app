import 'package:flutter/material.dart';
import 'package:movify/features/details/presentation/widgets/shared/details_date_and_time_section.dart';
import 'package:movify/features/details/presentation/widgets/shared/details_image.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';
import 'package:movify/shared/presentation/widgets/adaptive_layout_widget.dart';
import 'package:movify/shared/presentation/widgets/mobile_play_button.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';
import 'package:movify/shared/presentation/widgets/tablet_play_button.dart';

class DetailsBodySectionTwo extends StatelessWidget {
  const DetailsBodySectionTwo({super.key, required this.cardModel, this.title});

  final CardDisplayModel cardModel;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: Hero(
            tag: '$title-${cardModel.id}',
            child: DetailsImage(posterPath: cardModel.posterPath),
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
                  type: cardModel.contentType.name,
                  id: cardModel.id.toString(),
                  title: cardModel.title,
                ),
                desktop: (context) => const SizedBox(),
                tablet: (context) => TabletPlayButton(
                  type: cardModel.contentType.name,
                  id: cardModel.id.toString(),
                  title: cardModel.title,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
