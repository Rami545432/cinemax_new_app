import 'package:flutter/material.dart';
import 'package:movify/core/formatters/formatted_date_method.dart';
import 'package:movify/features/details/domain/value_objects/review_results.dart';
import 'package:movify/features/details/presentation/widgets/details_widgets/more_less_button.dart';
import 'package:movify/features/details/presentation/widgets/shared/avatar_review.dart';
import 'package:movify/features/details/presentation/widgets/shared/metadata_review.dart';
import 'package:movify/features/details/presentation/widgets/shared/review_rating_badge.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({super.key, required this.review});

  final ReviewResults? review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatarUrl = review?.authorDetails?.avatarPath;
    final authorName =
        review?.author ??
        review?.authorDetails?.name ??
        review?.authorDetails?.username ??
        'Anonymous';
    final username = review?.authorDetails?.username;

    // Create elegant handle if different from main display name
    final displayUsername =
        (username != null && username.isNotEmpty && username != authorName)
        ? '@$username'
        : null;

    // Format date beautifully using existing FormattedDateMethods
    String formattedDate = '';
    if (review?.createdAt != null) {
      formattedDate = FormattedDateMethods.formatDateDayMonthYear(
        review?.createdAt?.toIso8601String(),
      );
    }

    final rating = review?.authorDetails?.rating;

    // Theme-specific colors decoupled dynamically via AppTheme configuration
    final cardColor = theme.cardColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              // Squircle Avatar with subtle premium border
              ReviewAvatar(avatarUrl: avatarUrl, authorName: authorName),
              const SizedBox(width: 12),

              // Author and Metadata Column
              Expanded(
                child: MetaDataReview(
                  authorName: authorName,
                  displayUsername: displayUsername,
                  formattedDate: formattedDate,
                ),
              ),
              const SizedBox(width: 8),

              // Premium Rating Pill Badge
              if (rating != null && rating > 0)
                ReviewRatingBadge(rating: rating),
            ],
          ),
          const SizedBox(height: 12),

          // Review Content body
          MoreLessButton(overview: review?.content ?? ''),
        ],
      ),
    );
  }
}
