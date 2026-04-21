import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/about_tab_view_branch.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/movie_data_table.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/trailers_image_list_view_builder.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieAboutTabView extends StatelessWidget {
  const MovieAboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetailsEntity = context.watch<MovieDetailsEntity>();
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        AboutTabViewBranch(
          title: l10n.informations,
          child: const MovieDataTable(),
        ),
        const Divider(),
        const SizedBox(height: 20),
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
