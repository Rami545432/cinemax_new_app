import 'package:flutter/material.dart';
import 'package:movify/l10n/app_localizations.dart';

class ClosedSearchContainer extends StatelessWidget {
  const ClosedSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              l10n.searchHint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
