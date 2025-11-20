import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/data/models/arguments/season_view_argument.dart';
import 'package:cinemax_app_new/features/details/domain/enums/tabs_enums.dart';
import 'package:cinemax_app_new/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../shared/custom_tab_bar.dart';
import '../shared/details_sliver_app_bar.dart';
import '../../../../series/presentation/widgets/season_image_and_info.dart';
import 'season_tabs_bloc_builder.dart';

class SeasonBodyContent extends HookWidget {
  const SeasonBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SeasonViewArgument>();
    final scrollCollapse = useScrollCollapseDebounced(150);
    List<Tab> seasonTabs = SeasonDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    return DefaultTabController(
      length: seasonTabs.length,
      child: NestedScrollView(
        controller: scrollCollapse.scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            DetailsSliverAppBar(
              date: model.seasonDate ?? '_',
              backGroundImage: model.backDropImageUrl ?? '_',
              defaultDetailsBackGroundImage: model.posterImageUrl,
              isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
              id: model.id,
              seasonNumber: model.seasonNumber ?? 0,
              specificId: model.specificId ?? 0,
              title: model.seasonName ?? '_',
              contentType: ContentType.seasons,
              posterImage: model.seasonPosterPath ?? '',
              seriesBackUpImage: model.posterImageUrl ?? '',
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SeasonImageAndInfo(
                  defaultImageUrl: model.posterImageUrl ?? '',
                  posterPath: model.seasonPosterPath ?? '',
                  title: model.seasonName ?? '',
                  date: model.seasonDate ?? '_',
                  voteAverage: model.seasonRating ?? 0,
                ),
              ),
            ),
            CustomTabBar(tabs: seasonTabs),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: SeasonTabsBlocBuilder(
            seiresPosterPath: model.posterImageUrl ?? '',
          ),
        ),
      ),
    );
  }
}
