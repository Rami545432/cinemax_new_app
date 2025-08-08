import 'package:flutter/material.dart';

import '../../../../domian/entites/movie_details_entity.dart';
import 'about_tab_bar_view.dart';
import 'actor_info.dart';
import 'movie_about_tab_view.dart';
import 'recomended_tab_bar_view.dart';

class MovieDetailComponets extends StatelessWidget {
  const MovieDetailComponets({super.key, required this.movieDetailsEntity});
  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TabBarView(
        children: [
          AboutTabBarView(
            overview: movieDetailsEntity.overView,
            geners: movieDetailsEntity.genres,
            child: MovieAboutTabView(movieDetailsEntity: movieDetailsEntity),
          ),
          ActorInfo(actorList: movieDetailsEntity.actorName),
          RecomendedTabBarView(),
        ],
      ),
    );
  }
}
