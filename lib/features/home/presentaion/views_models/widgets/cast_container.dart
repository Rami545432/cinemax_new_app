import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../domian/entites/movie_details_entity.dart';
import 'film_cast_info.dart';

class CastContainer extends StatelessWidget {
  const CastContainer({super.key, required this.movieDetailsEntity});
  final MovieDetailsEntity movieDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cast And Crew', style: AppStyles.textStyle16(context)),
          const SizedBox(height: 16),
          SizedBox(
            height: 60,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: movieDetailsEntity.actorName.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilmCastInfo(
                    actorName: movieDetailsEntity.actorName[index].name ?? '',
                    actorImage:
                        movieDetailsEntity.actorName[index].profilePath ?? '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
