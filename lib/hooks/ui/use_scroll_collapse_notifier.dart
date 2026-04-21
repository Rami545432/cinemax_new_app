import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Result class containing the collapsed state notifier
class ScrollCollapseResult {
  final ValueNotifier<bool> isCollapsedNotifier;

  ScrollCollapseResult({required this.isCollapsedNotifier});

  /// Convenience getter
  bool get isCollapsed => isCollapsedNotifier.value;
}

/// A simpler, more reliable hook for detecting when a SliverAppBar has collapsed
///
/// This hook monitors scroll position and updates a ValueNotifier when the
/// scroll offset exceeds the specified threshold.
///
/// [collapseThreshold] - The scroll offset at which the app bar is considered collapsed
/// Defaults to 200 pixels if not specified
///
/// Returns a [ScrollCollapseResult] containing the isCollapsedNotifier
ScrollCollapseResult useScrollCollapseNotifier([
  double collapseThreshold = 200.0,
]) {
  final isCollapsedNotifier = useState(false);
  final notifier = useMemoized(() => ValueNotifier<bool>(false), []);

  useEffect(() {
    // Sync the state with the notifier
    notifier.value = isCollapsedNotifier.value;
    return null;
  }, [isCollapsedNotifier.value]);

  // Return the result
  return ScrollCollapseResult(isCollapsedNotifier: notifier);
}

/// An alternative approach that uses a ScrollController
/// This is useful when you need fine-grained control over scroll position
///
/// [collapseThreshold] - The scroll offset at which the app bar is considered collapsed
///
// ignore: unintended_html_in_doc_comment
/// Returns a tuple of (ScrollController, ValueNotifier<bool>)
(ScrollController, ValueNotifier<bool>) useScrollCollapseWithController([
  double collapseThreshold = 200.0,
]) {
  final scrollController = useScrollController();
  final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));

  useEffect(() {
    void onScroll() {
      if (!scrollController.hasClients) {
        return;
      }

      final offset = scrollController.offset;
      final shouldCollapse = offset >= collapseThreshold;

      if (isCollapsedNotifier.value != shouldCollapse) {
        isCollapsedNotifier.value = shouldCollapse;
      }
    }

    scrollController.addListener(onScroll);
    return () => scrollController.removeListener(onScroll);
  }, [scrollController, collapseThreshold]);

  return (scrollController, isCollapsedNotifier);
}
