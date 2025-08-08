import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/animations/build_animated_list_item.dart';
import '../../../data/models/search_history_model.dart';
import '../manger/search_cubit/search_cubit.dart';
import 'search_history_app_bar.dart';
import 'search_history_list_tile.dart';

class SearchHistoryAnimatedList extends StatefulWidget {
  const SearchHistoryAnimatedList({super.key, required this.searchHistory});

  final List<SearchHistoryModel> searchHistory;

  @override
  State<SearchHistoryAnimatedList> createState() =>
      _SearchHistoryAnimatedListState();
}

class _SearchHistoryAnimatedListState extends State<SearchHistoryAnimatedList> {
  final _listKey = GlobalKey<SliverAnimatedListState>();
  late List<SearchHistoryModel> _searchHistory;

  @override
  void initState() {
    super.initState();
    _searchHistory = List.from(widget.searchHistory);
  }

  void _removeItem(int index) {
    if (index < 0 || index >= _searchHistory.length) return;

    final removedItem = _searchHistory[index];

    setState(() {
      _searchHistory.removeAt(index);
    });

    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedItem, animation),
      duration: const Duration(milliseconds: 300),
    );

    context.read<SearchCubit>().deleteSearchHistory(removedItem.id);
  }

  void _removeAllItems() {
    if (_searchHistory.isEmpty) {
      context.read<SearchCubit>().clearSearchHistory();
      return;
    }

    for (int i = _searchHistory.length - 1; i >= 0; i--) {
      final removedItem = _searchHistory[i];

      Future.delayed(
        Duration(milliseconds: ((_searchHistory.length - 1 - i) * 100)),
        () {
          if (mounted && _listKey.currentState != null) {
            setState(() {
              if (i < _searchHistory.length) {
                _searchHistory.removeAt(i);
              }
            });

            _listKey.currentState?.removeItem(
              i,
              (context, animation) => _buildRemovedItem(removedItem, animation),
              duration: const Duration(milliseconds: 300),
            );
          }
        },
      );
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<SearchCubit>().clearSearchHistory();
      }
    });
  }

  Widget _buildRemovedItem(
    SearchHistoryModel item,
    Animation<double> animation,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1.0, 0.0),
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
      child: FadeTransition(
        opacity: animation,
        child: SearchHistoryListTile(searchHistory: item, onDelete: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchHistoryAppBar(onClear: _removeAllItems),
          ),
        ),
        SliverAnimatedList(
          key: _listKey,
          initialItemCount: _searchHistory.length,
          itemBuilder: (context, index, animation) {
            if (index >= _searchHistory.length) {
              return const SizedBox.shrink();
            }

            final item = _searchHistory[index];
            return BuildAnimatedListItem(
              animation: animation,
              index: index,
              child: SearchHistoryListTile(
                searchHistory: item,
                onDelete: () => _removeItem(index),
              ),
            );
          },
        ),
      ],
    );
  }
}
