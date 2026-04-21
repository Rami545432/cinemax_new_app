import 'package:cinemax_app_new/features/search/presentation/widgets/search_tab_bar_views.dart';
import 'package:flutter/material.dart';

class SuggestedSearchBlocBuilder extends StatelessWidget {
  const SuggestedSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) =>
      const SearchTabBarViews(results: [], movies: [], tvShows: []);
}
