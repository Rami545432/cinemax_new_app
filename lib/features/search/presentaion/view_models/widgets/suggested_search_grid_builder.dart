import 'package:flutter/material.dart';

import '../../../data/models/search_result.dart';
import 'animated_search_result_item.dart';
import 'search_animation_controller.dart';
import 'custom_grid_config.dart';

class SuggestedSearchGridBuilder extends StatefulWidget {
  const SuggestedSearchGridBuilder({super.key, required this.results});
  final List<SearchResult> results;

  @override
  State<SuggestedSearchGridBuilder> createState() =>
      _SuggestedSearchGridBuilderState();
}

class _SuggestedSearchGridBuilderState
    extends State<SuggestedSearchGridBuilder> {
  late final SearchAnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = SearchAnimationController();
  }

  @override
  void didUpdateWidget(SuggestedSearchGridBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.results != widget.results) {
      _animationController.updateResults(widget.results);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListenableBuilder(
        listenable: _animationController,
        builder: (context, child) {
          return RepaintBoundary(
            child: GridView.builder(
              itemCount: widget.results.length,
              itemBuilder: (context, index) {
                final result = widget.results[index];
                return _buildAnimatedItem(result, index);
              },
              gridDelegate: CustomGridConfig.getDelegate(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedItem(SearchResult result, int index) {
    final isFirstSearch = _animationController.isFirstSearch;
    final shouldAnimate =
        isFirstSearch || _animationController.isNewItem(result);

    return AnimatedSearchResultItem(
      result: result,
      index: index,

      shouldAnimate: shouldAnimate,
      isFirstSearch: isFirstSearch,
    );
  }
}
