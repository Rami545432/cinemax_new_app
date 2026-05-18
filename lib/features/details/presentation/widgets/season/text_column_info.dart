import 'package:flutter/material.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/core/utils/app_styles.dart';

class TextColumnInfo extends StatelessWidget {
  const TextColumnInfo({
    super.key,
    required this.title,
    required this.date,
    required this.voteAverage,
  });

  final String title;
  final String date;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    final style = AppStyles.textStyle18(context);
    return Column(
      spacing: 10,
      children: [
        Text(title, style: style),
        Text(FormattedDateMethods.formatDateMonthYear(date), style: style),
        Text('⭐ $voteAverage', style: style),
      ],
    );
  }
}
