import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../models/base_card_model.dart';

class HorizontalColumnTexts extends StatelessWidget {
  const HorizontalColumnTexts({super.key, required this.cardModel});

  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardModel.cardTitle, style: AppStyles.textStyle16(context)),
          Text(
            cardModel.cardDate.toString(),
            style: AppStyles.textStyle16(context),
          ),
        ],
      ),
    );
  }
}
