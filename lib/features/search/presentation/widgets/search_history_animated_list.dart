import 'package:cinemax_app_new/core/types/animation_types.dart';
import 'package:cinemax_app_new/core/utils/animations/animated_button.dart';
import 'package:cinemax_app_new/core/utils/animations/generic_animated_widget.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';
import 'package:cinemax_app_new/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:cinemax_app_new/features/search/presentation/extensions/search_tile_extention.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/search_history_app_bar.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/search_history_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
