import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/icon_text_row.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';

import 'time_bloc_selector.dart';

class DetailsDateAndTimeSection extends StatelessWidget {
  const DetailsDateAndTimeSection({super.key, required this.cardModel});

  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    final date = formatDateMonthYear(cardModel.cardDate!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 30,
      children: [
        Text(cardModel.cardTitle, style: AppStyles.textStyle18(context)),
        IconTextRow(
          text: date,
          iconData: Icons.calendar_month_outlined,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        cardModel.type == 'movie'
            ? const TimeBlocSelector()
            : const SizedBox.shrink(),
      ],
    );
  }
}
