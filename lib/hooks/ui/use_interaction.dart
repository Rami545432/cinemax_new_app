import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' hide useIsMounted;
import 'use_is_mounted.dart'; // Import it

VoidCallback useUserInteractionPause({
  required ValueNotifier<bool> isInteracting,
  Duration resumeDelay = const Duration(seconds: 5),
}) {
  final resumeTimer = useRef<Timer?>(null);
  final isMounted = useIsMountedd(); // ← ADD THIS

  useEffect(() {
    return () {
      resumeTimer.value?.cancel();
      resumeTimer.value = null;
    };
  }, []);

  return () {
    if (!isMounted()) return; // ← ADD THIS CHECK

    isInteracting.value = true;
    resumeTimer.value?.cancel();

    resumeTimer.value = Timer(resumeDelay, () {
      if (isMounted()) {
        // ← ADD THIS CHECK
        isInteracting.value = false;
      }
    });
  };
}
