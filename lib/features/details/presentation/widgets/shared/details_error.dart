import 'package:flutter/material.dart';
import 'package:movify/shared/presentation/widgets/retry_button.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({super.key, required this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
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
