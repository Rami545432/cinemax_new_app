import 'package:cinemax_app_new/core/utils/retry_button.dart';
import 'package:flutter/material.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({super.key, required this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message ?? 'Something went wrong'),
          const SizedBox(height: 12),
          RetryButton(onRetry: onRetry),
        ],
      ),
    );
  }
}
