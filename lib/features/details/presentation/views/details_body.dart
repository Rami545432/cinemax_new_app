import 'package:cinemax_app_new/features/details/domain/enums/tabs_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../core/utils/enums/content_type.dart';
import '../../../../hooks/ui/use_scroll_collapse_controller.dart';
import '../../../../models/base_card_model.dart';
import '../widgets/shared/build_body_content.dart';
import '../widgets/shared/custom_tab_bar.dart';
import '../widgets/shared/details_sliver_app_bar.dart';
import '../widgets/shared/movie_details_body_section_two.dart';

class DetailsBody extends HookWidget {
  const DetailsBody({
    super.key,
    required this.cardModel,
    this.fromRoute = 'home',
    this.title,
  });

  final BaseCardModel cardModel;
  final String fromRoute;
  final String? title;
  @override
  Widget build(BuildContext context) {
    List<Tab> movieTabs = MovieDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    List<Tab> seriesTabs = SeriesDetailsEnum.values
        .map((e) => e.localizedTab(context))
        .toList();
    final isMovie = cardModel.type == 'movie';
    final tabCount = isMovie ? movieTabs.length : seriesTabs.length;
    final scrollCollapse = useScrollCollapseDebounced(150);

    return DefaultTabController(
      length: tabCount,
      child: NestedScrollView(
        controller: scrollCollapse.scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            DetailsSliverAppBar(
              date: cardModel.cardDate ?? '',
              title: cardModel.cardTitle,
              backGroundImage: cardModel.horizontalCardImage,
              defaultDetailsBackGroundImage: cardModel.cardImage,

              isCollapsedNotifier: scrollCollapse.isCollapsedNotifier,
              id: cardModel.cardId,
              fromRoute: fromRoute,
              contentType: cardModel.contentType ?? ContentType.movies,
              specificId: cardModel.cardId,
              posterImage: cardModel.cardImage,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: MovieDetailsBodySectionTwo(
                  cardModel: cardModel,
                  title: title,
                ),
              ),
            ),
            CustomTabBar(tabs: isMovie ? movieTabs : seriesTabs),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BuildBodyContent(
            id: cardModel.cardId,
            type: cardModel.type ?? '',
          ),
        ),
      ),
    );
  }
}
