import 'package:cinemax_app_new/features/home/data/models/see_all_arguments_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.seeAllArgumentsModel});

  final SeeAllArgumentsModel seeAllArgumentsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      surfaceTintColor: AppPrimaryColors.dark,
      title: Text(
        seeAllArgumentsModel.title,
        style: AppStyles.textStyle16(context),
      ),
      leadingWidth: 40,
    );
  }
}
