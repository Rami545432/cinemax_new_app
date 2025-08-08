import 'package:cinemax_app_new/constant.dart';
import 'package:cinemax_app_new/core/utils/helper/scroll_collapse_mixin.dart';
import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/details_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/enums/content_type.dart';
import '../../../home/presentaion/views_models/widgets/details_widgets/season_view_argument.dart';
import '../widgets/details_image_and_info_section.dart';
import '../widgets/season_tabs_bloc_builder.dart';

class SeasonBody extends StatefulWidget {
  const SeasonBody({super.key, required this.seasonViewArgument});
  final SeasonViewArgument seasonViewArgument;

  @override
  State<SeasonBody> createState() => _SeasonBodyState();
}

class _SeasonBodyState extends State<SeasonBody>
    with ScrollCollapseMixin<SeasonBody> {
  @override
  Widget build(BuildContext context) {
    final item = widget.seasonViewArgument.season;
    String posterPath =
        item.posterPath ?? widget.seasonViewArgument.posterImageUrl!;
    String packDropImageUrl =
        widget.seasonViewArgument.packDropImageUrl ??
        widget.seasonViewArgument.posterImageUrl!;
    return DefaultTabController(
      length: seasontabs.length,
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            DetailsSliverAppBar(
              imageUrl: packDropImageUrl,
              isCollapsed: isCollapsed,
              id: item.id ?? 0,

              title: item.name ?? '',
              contentType: ContentType.seasons,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DetailsImageAndInfoSection(
                  posterPath: posterPath,
                  title: item.name ?? '',
                  date: item.airDate ?? 'Unknown',
                  voteAverage: item.voteAverage ?? 0,
                ),
              ),
            ),
            CustomTabBar(tabs: seasontabs),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: SeasonTabsBlocBuilder(),
        ),
      ),
    );
  }
}
