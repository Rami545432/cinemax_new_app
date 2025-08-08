import 'package:flutter/material.dart';

import '../size_config.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  const AdaptiveLayoutWidget({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });
  final WidgetBuilder mobile, desktop, tablet;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width < SizeConfig.mobile) {
          return mobile(context);
        } else if (width < SizeConfig.tablet) {
          return tablet(context);
        } else {
          return desktop(context);
        }
      },
    );
  }
}
