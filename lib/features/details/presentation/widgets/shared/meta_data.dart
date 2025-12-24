import 'package:cinemax_app_new/config/animations/extensions/widget_animations.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/details_widgets/time_bloc_selector.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/time_bloc_selector.dart';
import 'package:flutter/material.dart';

class MetaDataCoulmn extends StatelessWidget {
  const MetaDataCoulmn({
    super.key,
    required this.title,
    required this.date,
    required this.textStyle,
    required this.rating,
    this.timeBlocSelector,
  });

  final String title;
  final String date;
  final TextStyle textStyle;
  final num? rating;
  final Widget? timeBlocSelector;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.textStyle28(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ).fadeInFromBottom(delay: 300),

          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(FormattedDateMethods.formatDateYear(date), style: textStyle),

              timeBlocSelector ?? const SizedBox.shrink(),
              Icon(Icons.star_rate, color: Colors.yellow, size: 20),
              Text(rating?.toStringAsFixed(1) ?? '0.0', style: textStyle),
            ],
          ).fadeInFromBottom(delay: 600),
        ],
      ),
    );
  }
}
