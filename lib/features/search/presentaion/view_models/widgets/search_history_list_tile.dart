import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        // GoRouter.of(context).push(
        //   '${AppRouter.kMovieDetailView}?from=search',
        //   extra: searchHistory,
        // );
        final routeName = searchHistory.historyContentType == ContentType.movies
            ? RouteName.movieDetail
            : RouteName.tvDetail;
        context.pushNamed(
          routeName,
          pathParameters: {'id': searchHistory.id.toString()},
          queryParameters: {
            'heroTag': 'search-${searchHistory.id}',
            'posterImage': searchHistory.historyVerticalCardImage,
          },
        );
      },
    );
  }
}
