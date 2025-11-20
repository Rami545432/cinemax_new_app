import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width > SizeConfig.mobile ? 120 : 100,
      child: Text(
        title,
        style: AppStyles.textStyle14(
          context,
        ).copyWith(fontWeight: FontWeight.w700, height: 1.2),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
