import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.iconData,
    required this.text,
    this.color = Colors.grey,
  });
  final IconData iconData;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.textStyle16(context).copyWith(color: color);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(iconData, color: color),
        Text(text, style: textStyle),
      ],
    );
  }
}
