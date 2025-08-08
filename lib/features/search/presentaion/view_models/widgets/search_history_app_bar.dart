import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class SearchHistoryAppBar extends StatelessWidget {
  const SearchHistoryAppBar({super.key, required this.onClear});
  final VoidCallback onClear;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Search History',
          style: AppStyles.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: onClear,
          child: Text(
            'Clear',
            style: AppStyles.textStyle16(
              context,
            ).copyWith(color: AppPrimaryColors.blueAccent),
          ),
        ),
      ],
    );
  }
}
