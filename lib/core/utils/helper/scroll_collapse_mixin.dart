import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

mixin ScrollCollapseMixin<T extends StatefulWidget> on State<T> {
  late ScrollController scrollController;
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateScroll();
    });
    scrollController.addListener(updateScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(updateScroll);
    scrollController.dispose();
    super.dispose();
  }

  void updateScroll() {
    if (!scrollController.hasClients) return;

    final shouldCollapse = scrollController.offset >=
        MediaQuery.of(context).size.height * 0.4 - kToolbarHeight;

    if (shouldCollapse != isCollapsed) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            isCollapsed = shouldCollapse;
          });
        }
      });
    }
  }
}
