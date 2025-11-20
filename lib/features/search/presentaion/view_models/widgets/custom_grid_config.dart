import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomGridConfig {
  static SliverGridDelegateWithFixedCrossAxisCount getDelegate(
    BuildContext context,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: getCrossAxisCount(context),
      childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
      crossAxisSpacing: width > SizeConfig.mobile ? 30 : 20,
    );
  }

  static int getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width > SizeConfig.mobile ? 4 : 3;
  }
}
