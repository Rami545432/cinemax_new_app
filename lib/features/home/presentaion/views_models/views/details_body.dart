import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/enums/content_type.dart';
import '../../../../../core/utils/helper/scroll_collapse_mixin.dart';
import '../../../../../models/base_card_model.dart';
import '../widgets/details_widgets/build_body_content.dart';
import '../widgets/details_widgets/custom_tab_bar.dart';
import '../widgets/details_widgets/details_sliver_app_bar.dart';
import '../widgets/details_widgets/movie_details_body_section_two.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({
    super.key,
    required this.cardModel,
    this.fromRoute = 'home',
  });

  final BaseCardModel cardModel;
  final String fromRoute;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody>
    with ScrollCollapseMixin<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    final isMovie = widget.cardModel.type == 'movie';
    final tabCount = isMovie ? 3 : 4;

    return DefaultTabController(
      length: tabCount,
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            DetailsSliverAppBar(
              title: widget.cardModel.cardTitle,
              imageUrl: widget.cardModel.horizontalCardImage ?? '',
              isCollapsed: isCollapsed,
              id: widget.cardModel.cardId,
              fromRoute: widget.fromRoute,
              contentType: widget.cardModel.contentType ?? ContentType.movies,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: MovieDetailsBodySectionTwo(cardModel: widget.cardModel),
              ),
            ),
            CustomTabBar(tabs: isMovie ? movieTabs : seriesTabs),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BuildBodyContent(),
        ),
      ),
    );
  }
}
