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
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 24,
            width: 40,
            color: Colors.black.withValues(
              alpha: 0.3,
            ), // Semi-transparent background
            alignment: Alignment.center,
            child: FormattedRating(rating: rating),
          ),
        ),
      ],
    ),
  );
}
