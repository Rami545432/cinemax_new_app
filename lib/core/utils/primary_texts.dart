import 'package:flutter/material.dart';

import 'app_styles.dart';

class PrimaryTexts extends StatelessWidget {
  const PrimaryTexts({super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(title, style: AppStyles.textStyle24(context)),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle12(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
