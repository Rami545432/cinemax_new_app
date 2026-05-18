import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class SearchHistoryListTile extends StatelessWidget {
  const SearchHistoryListTile({
    super.key,
    required this.searchHistory,
    this.onDelete,
  });

  final CardDisplayModel searchHistory;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(searchHistory.title, style: AppStyles.textStyle14(context)),
    subtitle: Text(
      searchHistory.contentType == ContentType.movies ? 'Movie' : 'Tv Show',
      style: AppStyles.textStyle12(context),
    ),
    leading: const Icon(Icons.history),
    trailing: IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
    onTap: () {
      final routeName = searchHistory.contentType == ContentType.movies
          ? RouteName.movieDetail
          : RouteName.tvDetail;
      context.pushNamed(
        routeName,
        pathParameters: {'id': searchHistory.id.toString()},
        extra: searchHistory.toNavigationData(),
      );
    },
  );
}
