import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/base_card_model.dart';
import '../main_vertical_card.dart';

class CustomSliverGridViewBuilder extends StatelessWidget {
  const CustomSliverGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<List<BaseCardModel>>();
    final width = MediaQuery.sizeOf(context).width;
    return SliverGrid.builder(
      key: const PageStorageKey('film_list'),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
        childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return MainVerticalCard(cardModel: data[index], title: '');
      },
    );
  }
}
