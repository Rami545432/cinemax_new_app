import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/go_router.dart';
import '../../../data/models/search_history_model.dart';

class SearchHistoryListTile extends StatelessWidget {
  const SearchHistoryListTile({
    super.key,
    required this.searchHistory,
    this.onDelete,
  });

  final SearchHistoryModel searchHistory;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(searchHistory.query, style: AppStyles.textStyle14(context)),
      subtitle: Text(
        searchHistory.historyType == 'movie' ? 'Movie' : 'Tv Show',
        style: AppStyles.textStyle12(context),
      ),
      leading: Icon(Icons.history),
      trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
      onTap: () {
        GoRouter.of(context).push(
          '${AppRouter.kMovieDetailView}?from=search',
          extra: searchHistory,
        );
      },
    );
  }
}
