import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? trailing;

  const SectionTitle(this.title, {super.key, this.trailing});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: AppStyles.textStyle16(context)),
      if (trailing != null)
        Text(trailing!, style: AppStyles.textStyle14(context)),
    ],
  );
}
