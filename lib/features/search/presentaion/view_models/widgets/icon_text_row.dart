import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.iconData,
    required this.text,
    this.color = Colors.grey,
    this.spacing = 5,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });
  final IconData iconData;
  final String text;
  final Color color;
  final double spacing;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.textStyle16(context).copyWith(color: color);
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      spacing: spacing,
      children: [
        Icon(iconData, color: color),
        Text(text, style: textStyle),
      ],
    );
  }
}
