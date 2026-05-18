import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/reviews.dart';
import 'package:movify/features/details/presentation/widgets/shared/review_list_tile.dart';

class ReviewListViewBuilder extends StatelessWidget {
  const ReviewListViewBuilder({super.key, required this.reviews});

  final Reviews reviews;

  @override
  Widget build(BuildContext context) => ListView.separated(
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemCount: reviews.results?.length ?? 0,
    itemBuilder: (context, index) {
      final review = reviews.results?[index];
      return SizedBox(child: ReviewListTile(review: review));
    },
  );
}
