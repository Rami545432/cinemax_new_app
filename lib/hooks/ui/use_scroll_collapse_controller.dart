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

ScrollCollapseResult useScrollCollapseDebounced([
  double? customThreshold,
  Duration debounce = const Duration(milliseconds: 16),
]) {
  final scrollController = useScrollController();
  final isCollapsedNotifier = useMemoized(() => ValueNotifier<bool>(false));
  final context = useContext();
  final debounceTimer = useRef<Timer?>(null);

  useEffect(() {
    final threshold =
        customThreshold ??
        (MediaQuery.of(context).size.height * 0.4 - kToolbarHeight);

    void updateScroll() {
      debounceTimer.value?.cancel();

      debounceTimer.value = Timer(debounce, () {
        if (!scrollController.hasClients) return;
        if (scrollController.positions.isEmpty) return;

        try {
          final offset = scrollController.offset;
          final shouldCollapse = offset >= threshold;

          // ✅ Update ValueNotifier instead of useState
          // This won't trigger DetailsBody rebuild
          if (shouldCollapse != isCollapsedNotifier.value) {
            isCollapsedNotifier.value = shouldCollapse;
          }
        } catch (e) {
          if (kDebugMode) {
            print('ScrollCollapse: Exception: $e');
          }
        }
      });
    }

    // Initial check
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        updateScroll();
      }
    });

    scrollController.addListener(updateScroll);

    return () {
      debounceTimer.value?.cancel();
      scrollController.removeListener(updateScroll);
      isCollapsedNotifier.dispose(); // Clean up notifier
    };
  }, [scrollController, customThreshold, debounce]);

  return ScrollCollapseResult(
    scrollController: scrollController,
    isCollapsedNotifier: isCollapsedNotifier,
  );
}
