import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class MainListCardMetaData extends StatelessWidget {
  const MainListCardMetaData({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: AppStyles.textStyle16(
          context,
        ).copyWith(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 6),
      Text(
        subtitle,
        style: AppStyles.textStyle14(
          context,
        ).copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    ],
  );
}
