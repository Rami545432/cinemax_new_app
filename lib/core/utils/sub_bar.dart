import 'package:flutter/material.dart';

import 'app_styles.dart';

class SubBar extends StatelessWidget {
  const SubBar({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        spacing: 8,
        children: [
          Text(
            title,
            style: AppStyles.textStyle18(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
