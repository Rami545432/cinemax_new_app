import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_date_method.dart';
import 'package:flutter/material.dart';

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: style),
        Text(FormattedDateMethods.formatDateMonthYear(date), style: style),
        Text('⭐ $voteAverage', style: style),
      ],
    );
  }
}
