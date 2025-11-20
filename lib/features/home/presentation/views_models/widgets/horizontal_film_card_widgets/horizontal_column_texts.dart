import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';

class HorizontalColumnTexts extends StatelessWidget {
  const HorizontalColumnTexts({super.key, required this.cardModel});

  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle16(context).copyWith(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardModel.cardTitle, style: style),
          Text(cardModel.cardDate.toString(), style: style),
        ],
      ),
    );
  }
}
