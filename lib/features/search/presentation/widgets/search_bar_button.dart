import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movify/features/search/presentation/widgets/search_provider.dart';
import 'package:movify/l10n/app_localizations.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 600),
      closedElevation: 0,
      openColor: Theme.of(context).colorScheme.primary,
      closedColor: Theme.of(context).colorScheme.primary,
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: _buildClosedContainer(context, l10n),
      ),
      openBuilder: (context, action) => const SearchMultiProviders(),
    );
  }

  Widget _buildClosedContainer(BuildContext context, AppLocalizations l10n) =>
      Container(
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
            Text(
              l10n.searchHint,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
}
