import 'package:flutter/material.dart';

class CustomNotificationListener extends StatelessWidget {
  final double collapseThreshold;
  final ValueNotifier<bool> isCollapsedNotifier;
  final Widget child;

  const CustomNotificationListener({
    super.key,
    required this.collapseThreshold,
    required this.isCollapsedNotifier,
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
        child: child,
        onNotification: (scrollNotification) {
          if (scrollNotification.depth == 0) {
            final offset = scrollNotification.metrics.pixels;
            final shouldCollapse = offset >= collapseThreshold;

            if (isCollapsedNotifier.value != shouldCollapse) {
              isCollapsedNotifier.value = shouldCollapse;
            }
          }
          return false;
        },
      );
}
