import 'package:flutter/material.dart';

import '../../../../domian/entites/movie_details_entity.dart';
import 'about_tab_view_branch.dart';
import 'movie_data_table.dart';
import 'trailers_image_list_view_builder.dart';

class MovieAboutTabView extends StatelessWidget {
  const MovieAboutTabView({super.key, required this.movieDetailsEntity});

  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutTabViewBranch(
          title: 'Informations',
          child: MovieDataTable(movieDetailsEntity: movieDetailsEntity),
        ),
        Divider(),
        SizedBox(height: 20),
        AboutTabViewBranch(
          title: 'Trailers',
          child: TrailersImageListViewBuilder(
            videoKey: movieDetailsEntity.kVideos!.results!
                .map((e) => e.key)
                .toList(),
          ),
        ),
      ],
    );
  }
}
