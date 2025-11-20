import 'dart:async';
import 'package:cinemax_app_new/hooks/ui/use_is_mounted.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useAutoScroll({
  required PageController controller,
  required bool isEnabled,
  required ValueNotifier<bool> isUserInteracting,
  Duration interval = const Duration(seconds: 3),
  Duration animationDuration = const Duration(milliseconds: 400),
  Curve curve = Curves.easeInOut,
}) {
  final isMounted = useIsMountedd();
  useEffect(() {
    if (!isEnabled) return null;

    final timer = Timer.periodic(interval, (_) {
      if (!controller.hasClients || isUserInteracting.value || !isMounted()) {
        return;
      }

      final currentPage = controller.page?.round() ?? 0;
      controller.animateToPage(
        currentPage + 1,
        duration: animationDuration,
        curve: curve,
      );
    });

    return () {
      timer.cancel();
    };
  }, [isEnabled, isUserInteracting]);
}
