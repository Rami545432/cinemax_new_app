import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

/// Reusable end-of-list slot.
/// Works for both horizontal and vertical lists.
class PaginationBottomSlot extends StatelessWidget {
  final bool isFetchingMore;
  final String? fetchMoreError;
  final bool hasMore;
  final bool isHorizontal;
  final VoidCallback onRetry;

  const PaginationBottomSlot({
    super.key,
    required this.isFetchingMore,
    required this.fetchMoreError,
    required this.hasMore,
    required this.onRetry,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    // Loading next page
    if (isFetchingMore) {
      return isHorizontal
          ? const SizedBox(
              width: 60,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            )
          : const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            );
    }

    // Next page failed
    if (fetchMoreError != null) {
      return isHorizontal
          ? SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.refresh, size: 18),
                  const SizedBox(height: 4),
                  TextButton(onPressed: onRetry, child: const Text('Retry')),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: TextButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ),
            );
    }

    // No more pages
    if (!hasMore) {
      return isHorizontal
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'End of list',
                  style: AppStyles.textStyle16(context),
                ),
              ),
            );
    }

    return const SizedBox.shrink();
  }
}
