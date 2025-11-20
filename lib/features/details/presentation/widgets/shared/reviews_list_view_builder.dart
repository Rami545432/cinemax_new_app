import 'package:cinemax_app_new/features/details/data/models/shared_details_models/reviews.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/review_list_tile.dart';
import 'package:flutter/material.dart';

class ReviewListViewBuilder extends StatelessWidget {
  const ReviewListViewBuilder({super.key, required this.reviews});

  final Reviews reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
      itemCount: reviews.results?.length ?? 0,
      itemBuilder: (context, index) {
        final review = reviews.results?[index];
        return SizedBox(child: ReviewListTile(review: review));
      },
    );
  }
}
