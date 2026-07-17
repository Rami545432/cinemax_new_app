import 'package:flutter/material.dart';
import 'package:movify/features/search/presentation/widgets/search_tab_bar_views.dart';

class SuggestedSearchBlocBuilder extends StatelessWidget {
  const SuggestedSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) =>
      const SearchTabBarViews(results: [], movies: [], tvShows: []);
}
