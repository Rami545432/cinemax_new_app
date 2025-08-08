import 'package:flutter/material.dart';

import 'formmatted_rating.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating});

  final num rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(),
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
}
