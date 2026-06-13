import 'package:flutter/material.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class CustomGridConfig {
  static SliverGridDelegateWithFixedCrossAxisCount getDelegate(
    BuildContext context,
  ) {
    final width = MediaQuery.widthOf(context);
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: getCrossAxisCount(context),
      childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
      crossAxisSpacing: width > SizeConfig.mobile ? 30 : 20,
    );
  }

  static int getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    return width > SizeConfig.mobile ? 4 : 3;
  }
}
