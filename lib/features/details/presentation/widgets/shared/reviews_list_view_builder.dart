import 'package:flutter/material.dart';
import 'package:movify/features/details/domain/value_objects/reviews.dart';
import 'package:movify/features/details/presentation/widgets/shared/review_list_tile.dart';
import 'package:movify/shared/presentation/widgets/premium_staggered_entrance.dart';

class ReviewListViewBuilder extends StatefulWidget {
  const ReviewListViewBuilder({super.key, required this.reviews});

  final Reviews reviews;

  @override
  State<ReviewListViewBuilder> createState() => _ReviewListViewBuilderState();
}

class _ReviewListViewBuilderState extends State<ReviewListViewBuilder> {
  final Set<int> _animatedIndices = {};
  @override
  Widget build(BuildContext context) => ListView.separated(
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemCount: widget.reviews.results?.length ?? 0,

    itemBuilder: (context, index) {
      final review = widget.reviews.results?[index];
      return PremiumStaggeredEntrance(
        index: index,
        isAnimated: _animatedIndices.contains(index),
        markAsAnimated: () => _animatedIndices.add(index),
        child: SizedBox(
          child: ReviewListTile(key: ValueKey(review?.id), review: review),
        ),
      );
    },
  );
}
