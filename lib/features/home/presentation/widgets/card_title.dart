import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/shared/presentation/widgets/size_config.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    return SizedBox(
      width: width > SizeConfig.mobile ? 120 : 100,
      child: Text(
        title,
        style: AppStyles.textStyle12(
          context,
        ).copyWith(fontWeight: FontWeight.w700, height: 1.2),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
