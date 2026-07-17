import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/presentation/widgets/details_widgets/custom_descreption.dart';
import 'package:movify/features/details/presentation/widgets/season/season_data_table.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_view_branch.dart';
import 'package:movify/features/details/presentation/widgets/shared/trailers_image_list_view_builder.dart';
import 'package:movify/l10n/app_localizations.dart';

class SeasonAboutTab extends StatelessWidget {
  const SeasonAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<SeriesSeasonDetailsEntity>();
    final l10n = AppLocalizations.of(context)!;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            spacing: 50,
            children: [
              const SizedBox(),
              CustomDescreption(overview: data.seasonOverView),
              const Divider(),
              AboutTabViewBranch(
                title: l10n.informations,
                child: SeasonDataTable(data: data),
              ),
              const Divider(),
              if (data.seasonVideos != null)
                AboutTabViewBranch(
                  title: l10n.trailers,
                  child: TrailersImageListViewBuilder(
                    videos: data.seasonVideos!,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
