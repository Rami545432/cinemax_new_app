import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

import '../../../domian/entites/movie_entity.dart';

class HorizontalFilmCardTitleText extends StatelessWidget {
  const HorizontalFilmCardTitleText({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.08,
      left: MediaQuery.of(context).size.width * 0.06,
      child: SizedBox(
        width: 300,
        child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          movieEntity.movieTitle,
          style: AppStyles.textStyle16(context),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
