import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/ads/mrec_ad_widget.dart';
import 'package:movify/features/details/domain/entites/movie_details_entity.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_view_branch.dart';
import 'package:movify/features/details/presentation/widgets/shared/movie_data_table.dart';
import 'package:movify/features/details/presentation/widgets/shared/trailers_image_list_view_builder.dart';
import 'package:movify/l10n/app_localizations.dart';

class MovieAboutTabView extends StatelessWidget {
  const MovieAboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetailsEntity = context.read<MovieDetailsEntity>();
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutTabViewBranch(
            title: l10n.informations,
            child: const MovieDataTable(),
          ),
          const SizedBox(height: 20),
          const Center(
            child: MrecAdWidget(),
          ), // Medium Rectangle Ad fits perfectly here!
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          AboutTabViewBranch(
            title: l10n.trailers,
            child: TrailersImageListViewBuilder(
              videos: movieDetailsEntity.kVideos!,
            ),
          ),
        ],
      ),
    );
  }
}
