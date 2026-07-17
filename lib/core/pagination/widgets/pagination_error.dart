import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';

class PaginationErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final bool isCompact; // compact for horizontal row, full for full screen

  const PaginationErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(height: 8),
              Text(
                message,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: onRetry,
                child: Text('Retry', style: AppStyles.textStyle16(context)),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Text('Try again', style: AppStyles.textStyle16(context)),
          ),
        ],
      ),
    );
  }
}
