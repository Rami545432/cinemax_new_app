import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/animations/generic_animated_widget.dart';
import '../../../../../core/utils/animations/remove_animation_builder.dart';
import '../../../data/models/search_history_model.dart';
import '../manger/search_cubit/search_cubit.dart';
import 'search_history_app_bar.dart';
import 'search_history_list_tile.dart';

class SearchHistoryAnimatedList extends StatelessWidget {
  const SearchHistoryAnimatedList({super.key, required this.searchHistory});
  final List<SearchHistoryModel> searchHistory;

  @override
  Widget build(BuildContext context) {
    return GenericAnimatedWidget<SearchHistoryModel>(
      widgetType: GenericAnimatedWidgetType.list,
      removeAnimationType: RemoveAnimationType.slideFromBottom,
      items: searchHistory,
      itemBuilder: (item, onRemove) =>
          SearchHistoryListTile(searchHistory: item, onDelete: onRemove),
      onItemRemoved: (item) =>
          context.read<SearchCubit>().deleteSearchHistory(item.id),
      onAllItemsRemoved: () => context.read<SearchCubit>().clearSearchHistory(),
      headerWidget: (onClear) => SearchHistoryAppBar(onClear: onClear),
    );
  }
}
