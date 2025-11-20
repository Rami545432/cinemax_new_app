import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FavortieEmptyList extends StatelessWidget {
  const FavortieEmptyList({super.key, required this.type});
  final ContentType type;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite_border,
          size: 64,
          color: Colors.grey.withValues(alpha: 0.5),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.nofavorites(type.localizedTab(context).text!),
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.startAddingYourFavorite(type.localizedTab(context).text!),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
