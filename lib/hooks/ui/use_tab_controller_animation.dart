import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabControllerHookResult {
  final TabController controller;
  final double currentPage;

  TabControllerHookResult({
    required this.controller,
    required this.currentPage,
  });
}

TabControllerHookResult useTabControllerAnimation({
  required int length,
  required int initialIndex,
  TickerProvider? vsync,
}) {
  final tabController = useTabController(
    initialLength: length,
    initialIndex: initialIndex,
    vsync: vsync,
  );
  final currentPage = useState(initialIndex.toDouble());
  useEffect(() {
    void handleTabAnimation() {
      if (tabController.animation != null) {
        currentPage.value = tabController.animation!.value;
      }
    }

    tabController.animation?.addListener(handleTabAnimation);
    return () {
      tabController.animation?.removeListener(handleTabAnimation);
    };
  }, [tabController.animation]);
  return TabControllerHookResult(
    controller: tabController,
    currentPage: tabController.index.toDouble(),
  );
}
