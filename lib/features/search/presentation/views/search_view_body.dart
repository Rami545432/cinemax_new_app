import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/search/presentation/blocs/search_bloc.dart';
import 'package:movify/features/search/presentation/blocs/search_states.dart';
import 'package:movify/features/search/presentation/views/history_view.dart';
import 'package:movify/features/search/presentation/widgets/search_tab_bar_views.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<SearchBloc, SearchState>(
    builder: (context, state) => switch (state) {
      SearchInitial() => const HistoryView(),
      SearchLoading() => const Center(child: CircularProgressIndicator()),
      SearchLoaded(
        results: final results,
        movies: final movies,
        tvShows: final tvShows,
      ) =>
        SearchTabBarViews(results: results, movies: movies, tvShows: tvShows),
      SearchError(errorMessage: final errorMessage) => Center(
        child: Text(errorMessage),
      ),
    },
  );
}
