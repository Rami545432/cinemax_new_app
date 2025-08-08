import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/size_config.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width > SizeConfig.mobile ? 120 : 80,

      child: Text(
        title,
        style: AppStyles.textStyle14(context),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
