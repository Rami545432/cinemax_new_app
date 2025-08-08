import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../models/base_card_model.dart';
import '../main_vertical_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.data});
  final List<BaseCardModel> data;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GridView.builder(
      itemCount: data.length,

      itemBuilder: (context, index) {
        return MainVerticalCard(cardModel: data[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
        childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
        crossAxisSpacing: width > SizeConfig.mobile ? 30 : 20,
      ),
    );
  }
}
