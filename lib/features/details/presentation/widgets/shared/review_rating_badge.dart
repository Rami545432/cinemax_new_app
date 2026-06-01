import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';

class ReviewRatingBadge extends StatelessWidget {
  const ReviewRatingBadge({super.key, required this.rating});

  final double? rating;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
      color: AppSecondryColors.orange.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppSecondryColors.orange.withValues(alpha: 0.35),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: AppSecondryColors.orange, size: 16),
        const SizedBox(width: 4),
        Text(
          rating?.toStringAsFixed(1) ?? '',
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
