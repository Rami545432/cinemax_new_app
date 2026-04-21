import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? trailing;

  const SectionTitle(this.title, {super.key, this.trailing});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleSmall),
      if (trailing != null)
        Text(trailing!, style: Theme.of(context).textTheme.bodySmall),
    ],
  );
}
