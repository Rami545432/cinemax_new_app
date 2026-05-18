import 'package:flutter/material.dart';
import 'package:movify/core/animations/animated_button.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/presentation/widgets/shared/time_bloc_selector.dart';
import 'package:movify/features/search/presentation/widgets/icon_text_row.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class DetailsDateAndTimeSection extends StatelessWidget {
  const DetailsDateAndTimeSection({super.key, required this.cardModel});

  final CardDisplayModel cardModel;

  @override
  Widget build(BuildContext context) {
    final date = FormattedDateMethods.formatDateMonthYear(cardModel.date);
    return AnimatedButton(
      entranceAnimation: ButtonAnimationType.fade,

      entranceDelay: const Duration(milliseconds: 300),
      animationDuration: const Duration(milliseconds: 300),
      child: Column(
        spacing: 30,
        children: [
          Text(cardModel.title, style: AppStyles.textStyle18(context)),
          IconTextRow(
            text: date,
            iconData: Icons.calendar_month_outlined,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          IconTextRow(
            text: cardModel.rating?.toStringAsFixed(1) ?? '0.0',
            iconData: Icons.star_rate,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          cardModel.contentType == ContentType.movies
              ? const TimeBlocSelector()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
