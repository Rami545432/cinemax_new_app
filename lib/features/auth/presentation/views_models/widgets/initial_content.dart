import 'package:cinemax_app_new/constants/assets.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InitialContent extends StatelessWidget {
  const InitialContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 0.6,
            child: SvgPicture.asset(Assets.imagesLiveTvBlack24dp1),
          ),
        ),
        Expanded(child: Text('CINEMAX', style: AppStyles.textStyle28(context))),
      ],
    );
  }
}
