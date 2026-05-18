import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class AboutTabViewBranch extends StatelessWidget {
  const AboutTabViewBranch({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) => Column(
    spacing: 20,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: AppStyles.textStyle24(context)),
      Container(child: child),
    ],
  );
}
