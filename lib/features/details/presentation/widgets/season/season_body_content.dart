import 'package:cinemax_app_new/features/details/data/models/arguments/season_view_argument.dart';
import 'package:cinemax_app_new/features/details/domain/enums/tabs_enums.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/stacked_details_background.dart';
import 'package:cinemax_app_new/hooks/ui/use_scroll_collapse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../shared/custom_tab_bar.dart';
import '../shared/details_sliver_app_bar.dart';
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
              title: model.seasonName ?? 'Season ${model.seasonNumber}',
              isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
              favorite: model.toFavoriteEntity(),
              backgroundWidget: StackedDetailsBackGorund(
                backGroundImage: model.seasonPosterPath ?? '',
                posterImage: model.seasonPosterPath ?? '',
                title: model.seasonName ?? '_',
                date: model.seasonDate ?? '_',
                rating: model.seasonRating ?? 0,
                heroTag: '${model.id}-${model.specificId}',
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
