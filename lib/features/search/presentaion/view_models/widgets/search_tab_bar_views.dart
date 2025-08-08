import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../home/presentaion/views_models/widgets/details_widgets/custom_tab_bar.dart';
import '../../../data/models/search_result.dart';
import 'suggested_search_grid_builder.dart';

class SearchTabBarViews extends StatefulWidget {
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
  State<SearchTabBarViews> createState() => _SearchTabBarViewsState();
}

class _SearchTabBarViewsState extends State<SearchTabBarViews>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [CustomTabBar(tabs: searchTabs, controller: _tabController)];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          SuggestedSearchGridBuilder(results: widget.results),
          SuggestedSearchGridBuilder(results: widget.movies),
          SuggestedSearchGridBuilder(results: widget.tvShows),
        ],
      ),
    );
  }
}
