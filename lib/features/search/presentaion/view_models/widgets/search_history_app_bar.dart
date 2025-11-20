import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchHistoryAppBar extends StatelessWidget {
  const SearchHistoryAppBar({super.key, required this.onClear});
  final VoidCallback onClear;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.searchHistory,
            style: AppStyles.textStyle18(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: onClear,
            child: Text(
              l10n.clearHistory,
              style: AppStyles.textStyle16(
                context,
              ).copyWith(color: AppPrimaryColors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
