import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../models/see_all_arguments_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.seeAllArgumentsModel});

  final SeeAllArgumentsModel seeAllArgumentsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(
        seeAllArgumentsModel.title,
        style: AppStyles.textStyle16(context),
      ),
      leadingWidth: 40,
    );
  }
}
