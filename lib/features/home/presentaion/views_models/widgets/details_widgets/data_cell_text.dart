import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';

class DataCellText extends StatelessWidget {
  const DataCellText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final rowPadding = EdgeInsets.only(
      bottom: 20,
    );
    return Padding(
      padding: rowPadding,
      child: Text(
        text,
        style: AppStyles.textStyle16(context),
      ),
    );
  }
}
