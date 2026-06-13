import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:movify/features/search/presentation/cubits/search_history_states.dart';
import 'package:movify/features/search/presentation/widgets/search_history_animated_list.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchHistoryCubit, SearchHistoryState>(
        builder: (context, state) => switch (state) {
          SearchHistoryInitial() => const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          ),
          SearchHistoryEmpty() => const Center(child: Text('No history found')),
          SearchHistoryLoaded(searchHistory: final history) =>
            SearchHistoryAnimatedList(searchHistory: history),
          SearchHistoryFailure(errorMessage: final errorMessage) => Center(
            child: Text(errorMessage),
          ),
          _ => const SizedBox.shrink(),
        },
      );
}
