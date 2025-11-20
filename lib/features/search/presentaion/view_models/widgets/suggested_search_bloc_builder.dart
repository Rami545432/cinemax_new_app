import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/search_cubit/search_cubit.dart';
import 'search_history_animated_list.dart';
import 'search_not_find.dart';
import 'search_tab_bar_views.dart';

class SuggestedSearchBlocBuilder extends StatelessWidget {
  const SuggestedSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchHistorySuccess) {
          if (state.searchHistory.isEmpty) {
            return const Center(child: Text("Type to search ..."));
          }
          return SearchHistoryAnimatedList(searchHistory: state.searchHistory);
        }

        if (state is SearchSuccess) {
          if (state.results.isEmpty) {
            return Center(child: SearchNotFind());
          }
          return SearchTabBarViews(
            results: state.results,
            movies: state.movies,
            tvShows: state.tvShows,
          );
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const Center(child: Text("Type to search..."));
      },
    );
  }
}
