import 'package:cinemax_app_new/features/details/presentation/widgets/shared/custom_tab_bar.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/movie_genre_tab.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/series_genre_tab.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/widgets/search_bar_button.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DiscoverViewBody extends StatelessWidget {
  const DiscoverViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) {
          return [
            SliverAppBar(title: Text(l10n.discover), pinned: true),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: SearchBarButton(),
              ),
            ),
            CustomTabBar(
              tabs: [
                Tab(text: l10n.movies),
                Tab(text: l10n.tvShows),
              ],
            ),
          ];
        },
        body: TabBarView(children: [MovieGenreTab(), SeriesGenreTab()]),
      ),
    );
  }
}
