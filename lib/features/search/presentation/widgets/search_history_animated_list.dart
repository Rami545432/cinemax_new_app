import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/animations/animated_button.dart';
import 'package:movify/core/animations/generic_animated_widget.dart';
import 'package:movify/core/types/animation_types.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:movify/features/search/presentation/extensions/search_tile_extention.dart';
import 'package:movify/features/search/presentation/widgets/search_history_app_bar.dart';
import 'package:movify/features/search/presentation/widgets/search_history_list_tile.dart';

class SearchHistoryAnimatedList extends StatelessWidget {
  const SearchHistoryAnimatedList({super.key, required this.searchHistory});
  final List<SearchHistoryEntity> searchHistory;

  @override
  Widget build(BuildContext context) =>
      GenericAnimatedWidget<SearchHistoryEntity>(
        items: searchHistory,
        itemBuilder: (item, onRemove) => AnimatedListItem(
          entranceAnimation: ButtonAnimationType.fade,
          entranceDelay: Durations.long1,

          child: SearchHistoryListTile(
            searchHistory: item.toCardDisplay(),
            onDelete: onRemove,
          ),
        ),
        onItemRemoved: (item) =>
            context.read<SearchHistoryCubit>().deleteFromHistory(item.id),
        onAllItemsRemoved: () =>
            context.read<SearchHistoryCubit>().clearHistory(),
        headerWidget: (onClear) => SearchHistoryAppBar(onClear: onClear),
      );
}
