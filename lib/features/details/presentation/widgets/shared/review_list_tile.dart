import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/review_results.dart';
import 'package:movify/features/details/presentation/widgets/details_widgets/more_less_button.dart';
import 'package:movify/shared/presentation/widgets/rating.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({super.key, required this.review});

  final ReviewResults? review;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = review?.authorDetails?.avatarPath;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),

      tileColor: Colors.grey.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      trailing: Rating(rating: review?.authorDetails?.rating ?? 0),
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          tmdbImageSize(TmdbImageSize.w185, avatarUrl ?? ''),
        ),
        child: avatarUrl == null
            ? const Icon(Icons.person, color: Colors.white)
            : null,
      ),

      title: Text(review?.author ?? '', style: AppStyles.textStyle16(context)),
      subtitle: MoreLessButton(overview: review?.content ?? ''),
    );
  }
}
