import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/movie_details_entity.dart';
import 'about_tab_view_branch.dart';
import 'movie_data_table.dart';
import 'trailers_image_list_view_builder.dart';

class MovieAboutTabView extends StatelessWidget {
  const MovieAboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetailsEntity = context.watch<MovieDetailsEntity>();
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        AboutTabViewBranch(title: l10n.informations, child: MovieDataTable()),
        Divider(),
        SizedBox(height: 20),
        AboutTabViewBranch(
          title: l10n.trailers,
          child: TrailersImageListViewBuilder(
            videos: movieDetailsEntity.kVideos!,
          ),
        ),
      ],
    );
  }
}
