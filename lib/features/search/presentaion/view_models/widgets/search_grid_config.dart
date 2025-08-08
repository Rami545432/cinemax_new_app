import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class SearchGridConfig {
  static SliverGridDelegateWithFixedCrossAxisCount getDelegate(
    BuildContext context,
    int crossAxisCount,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.43,
      crossAxisSpacing: width > SizeConfig.mobile ? 30 : 20,
    );
  }

  static int getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width > SizeConfig.mobile ? 4 : 3;
  }
}
