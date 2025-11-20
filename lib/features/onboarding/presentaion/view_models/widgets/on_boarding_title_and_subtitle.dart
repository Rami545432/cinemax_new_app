import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/responsive_padding.dart';
import 'package:flutter/material.dart';

class OnBoardingTitleAndSubtitle extends StatelessWidget {
  const OnBoardingTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context),
      child: Column(
        spacing: 14,
        children: [
          Text(
            title,
            style: AppStyles.textStyle18(context),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle14(context).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
