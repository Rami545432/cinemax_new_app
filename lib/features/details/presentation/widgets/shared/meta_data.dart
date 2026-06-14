import 'package:flutter/material.dart';
import 'package:movify/config/animations/extensions/widget_animations.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/utils/app_styles.dart';

class MetaDataCoulmn extends StatelessWidget {
  const MetaDataCoulmn({
    super.key,
    required this.title,
    required this.date,
    required this.textStyle,
    required this.rating,
    this.timeBlocSelector,
    this.entryController,
  });

  final String title;
  final String date;
  final TextStyle textStyle;
  final num? rating;
  final Widget? timeBlocSelector;

  final AnimationController? entryController;

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style: AppStyles.textStyle28(
        context,
      ).copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );

    final rowWidget = Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(FormattedDateMethods.formatDateYear(date), style: textStyle),
        timeBlocSelector ?? const SizedBox.shrink(),
        const Icon(Icons.star_rate, color: Colors.yellow, size: 20),
        Text(rating?.toStringAsFixed(1) ?? '0.0', style: textStyle),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        children: [
          titleWidget.fadeInFromBottom(delay: 300, controller: entryController),
          rowWidget.fadeInFromBottom(delay: 600, controller: entryController),
        ],
      ),
    );
  }
}
