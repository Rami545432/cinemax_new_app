import 'package:flutter/material.dart';

import '../../../../core/utils/helper/formatted_date_method.dart';

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
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        Text(formatDateMonthYear(date)),
        Text('⭐ $voteAverage'),
      ],
    );
  }
}
