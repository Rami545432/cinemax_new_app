import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/details_widgets/more_less_button.dart';
import 'package:cinemax_app_new/core/utils/rating.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/review_results.dart';
import 'package:flutter/material.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({super.key, required this.review});

  final ReviewResults? review;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = review?.authorDetails?.avatarPath;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),

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
