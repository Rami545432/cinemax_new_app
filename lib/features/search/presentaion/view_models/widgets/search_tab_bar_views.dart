import 'package:cinemax_app_new/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../details/presentation/widgets/shared/custom_tab_bar.dart';
import '../../../data/models/search_result.dart';
import 'suggested_search_grid_builder.dart';

class SearchTabBarViews extends HookWidget {
  const SearchTabBarViews({
    super.key,
    required this.results,
    required this.movies,
    required this.tvShows,
  });
  final List<SearchResult> results;
  final List<SearchResult> movies;
  final List<SearchResult> tvShows;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: 3,
      vsync: useSingleTickerProvider(),
    );
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [CustomTabBar(tabs: searchTabs, controller: tabController)];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          SuggestedSearchGridBuilder(results: results),
          SuggestedSearchGridBuilder(results: movies),
          SuggestedSearchGridBuilder(results: tvShows),
        ],
      ),
    );
  }
}
