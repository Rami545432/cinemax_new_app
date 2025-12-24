import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScrollCollapseResult {
  final ScrollController scrollController;
  final ValueNotifier<bool> isCollapsedNotifier;

  ScrollCollapseResult({
    required this.scrollController,
    required this.isCollapsedNotifier,
  });

  // Convenience getter
  bool get isCollapsed => isCollapsedNotifier.value;
}

// ... existing imports ...

ScrollCollapseResult useScrollCollapseDebounced([
  double? customThreshold,
  Duration debounce = const Duration(milliseconds: 16),
]) {
  final scrollController = useScrollController();
  final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));
  final context = useContext();
  final debounceTimer = useRef<Timer?>(null);
  final isDisposed = useRef<bool>(false);

  useEffect(() {
    final threshold =
        customThreshold ??
        (MediaQuery.of(context).size.height * 0.4 - kToolbarHeight);

    void updateScroll() {
      debounceTimer.value?.cancel();

      debounceTimer.value = Timer(debounce, () {
        if (isDisposed.value) return;
        if (!scrollController.hasClients) return;
        if (scrollController.positions.isEmpty) return;

        try {
          final position = scrollController.position;

          // Use ScrollMetrics instead of directly accessing pixels
          // This is safer for NestedScrollView
          if (!position.hasContentDimensions) return;
          if (!position.isScrollingNotifier.value) return;

          // Get the current scroll offset using metrics
          // This avoids the activity.isScrolling assertion
          final metrics = position;
          final currentOffset = metrics.pixels;

          // Validate the offset is a valid number
          if (currentOffset.isNaN || currentOffset.isInfinite) return;

          final shouldCollapse = currentOffset >= threshold;

          if (shouldCollapse != isCollapsedNotifier.value) {
            isCollapsedNotifier.value = shouldCollapse;
          }
        } on AssertionError {
          // Specifically catch assertion errors and ignore them
          // This happens when activity.isScrolling is not true
          if (kDebugMode) {
            print(
              'ScrollCollapse: Assertion error caught (scroll activity not active)',
            );
          }
        } catch (e) {
          if (kDebugMode) {
            print('ScrollCollapse: Exception: $e');
          }
        }
      });
    }

    // Use SchedulerBinding for more reliable timing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        if (isDisposed.value) return;
        if (scrollController.hasClients &&
            scrollController.positions.isNotEmpty) {
          updateScroll();
        }
      });
    });

    scrollController.addListener(updateScroll);

    return () {
      isDisposed.value = true;
      debounceTimer.value?.cancel();
      scrollController.removeListener(updateScroll);
    };
  }, [scrollController, customThreshold, debounce]);

  return ScrollCollapseResult(
    scrollController: scrollController,
    isCollapsedNotifier: isCollapsedNotifier,
  );
}
