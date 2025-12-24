import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/details_success.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/stacked_details_background.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/enums/content_type.dart';

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({super.key, required this.posterImage, this.heroTag});
  final String posterImage;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return DetailsSuccess(
      favorite: FavoriteEntity(
        id: 0,
        title: '',
        posterImage: '',
        gener: [],
        contentType: ContentType.movies,
        date: '',
        seasonNumber: 0,
        specificId: 0,
        posterImageBackup: '',
        backGroundImage: '',
        episodeNumber: 0,
        rating: 0,
      ),
      tabs: [],
      backgroundWidget: StackedDetailsBackGorund(
        backGroundImage: '',
        posterImage: posterImage,
        title: '',
        date: '',
        rating: 0,
        heroTag: heroTag,
      ),
      body: Center(
        child: CircularProgressIndicator(color: AppPrimaryColors.blueAccent),
      ),
      title: '',
    );
  }
}
