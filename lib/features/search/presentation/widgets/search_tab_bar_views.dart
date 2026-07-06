import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/search/data/models/search_result.dart';
import 'package:movify/features/search/presentation/widgets/suggested_search_grid_builder.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/keep_alive_wrapper.dart';

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
    final isResultEmpty = results.isEmpty;
    return isResultEmpty
        ? Center(
            child: Text(
              l10n.noItemsFound,
              style: AppStyles.textStyle16(context),
            ),
          )
        : NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              CustomTabBar(tabs: searchTabs, controller: tabController),
            ],
            body: TabBarView(
              controller: tabController,
              children: [
                KeepAliveWrapper(
                  child: SuggestedSearchGridBuilder(results: results),
                ),
                KeepAliveWrapper(
                  child: SuggestedSearchGridBuilder(results: movies),
                ),
                KeepAliveWrapper(
                  child: SuggestedSearchGridBuilder(results: tvShows),
                ),
              ],
            ),
          );
  }
}
