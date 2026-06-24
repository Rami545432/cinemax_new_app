import 'package:flutter/material.dart';
import 'package:movify/shared/presentation/widgets/formmatted_rating.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating});

  final num rating;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(),
        // ⚡ Fix: Removed ClipRRect entirely.
        // Decorated the Container natively instead.
        Container(
          height: 24,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(
              6,
            ), // Standard rounding without layer context switches
          ),
          child: FormattedRating(rating: rating),
        ),
      ],
    ),
  );
}
