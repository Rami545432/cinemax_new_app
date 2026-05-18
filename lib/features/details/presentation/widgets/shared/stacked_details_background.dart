import 'package:flutter/material.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/meta_data.dart';
import 'package:movify/features/home/presentation/widgets/card_image.dart';
import 'package:movify/features/home/presentation/widgets/opcaity_details_image.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class StackedDetailsBackGorund extends StatelessWidget {
  const StackedDetailsBackGorund({
    super.key,
    required this.backGroundImage,
    required this.posterImage,
    required this.title,
    required this.date,
    required this.rating,
    required this.heroTag,
    this.timeBlocSelector,
  });

  final String? backGroundImage;
  final String? posterImage;
  final String? title;
  final String? date;
  final num? rating;
  final String? heroTag;
  final Widget? timeBlocSelector;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textStyle = AppStyles.textStyle16(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        OpcaityDetailsImage(
          detailsBackGroundImage: backGroundImage,
          defaultDetailsBackGroundImage: posterImage,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.surface,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.18,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              width: size.width < SizeConfig.mobile
                  ? size.width * 0.45
                  : size.width * 0.25,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: Hero(
                  tag: heroTag ?? '',
                  child: CardImage(
                    imageUrl: tmdbImageSize(
                      TmdbImageSize.w500,
                      posterImage ?? '',
                    ),
                    thumbnailUrl: tmdbImageSize(
                      TmdbImageSize.w300,
                      posterImage ?? '',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          left: MediaQuery.sizeOf(context).width * 0.05,
          right: MediaQuery.sizeOf(context).width * 0.05,
          child: MetaDataCoulmn(
            title: title!,
            date: date ?? 'Unknown',
            textStyle: textStyle,
            rating: rating,
            timeBlocSelector: timeBlocSelector,
          ),
        ),
      ],
    );
  }
}
