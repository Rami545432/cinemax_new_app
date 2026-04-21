import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/suggested_search_grid_builder.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final List<Tab> searchTabs = [
      Tab(text: l10n.all),
      Tab(text: l10n.movies),
      Tab(text: l10n.tvShows),
    ];
    final tabController = useTabController(
      initialLength: 3,
      vsync: useSingleTickerProvider(),
    );
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomTabBar(tabs: searchTabs, controller: tabController),
      ],
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
