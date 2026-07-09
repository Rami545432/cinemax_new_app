import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:movify/features/discover/presentation/widget/movie_genre_tab.dart';
import 'package:movify/features/discover/presentation/widget/series_genre_tab.dart';
import 'package:movify/features/search/presentation/widgets/search_bar_button.dart';
import 'package:movify/l10n/app_localizations.dart';

class DiscoverViewBody extends StatelessWidget {
  const DiscoverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          SliverAppBar(
            title: Text(l10n.discover, style: AppStyles.textStyle24(context)),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: SearchBarButton(),
            ),
          ),
          CustomTabBar(
            tabs: [
              Tab(text: l10n.movies),
              Tab(text: l10n.tvShows),
            ],
          ),
        ],
        body: const TabBarView(children: [MovieGenreTab(), SeriesGenreTab()]),
      ),
    );
  }
}
