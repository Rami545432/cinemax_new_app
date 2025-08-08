import 'package:cinemax_app_new/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../../core/utils/loading_bloc_builder.dart';
import '../../../../../../models/base_card_model.dart';
import '../main_vertical_card.dart';

class CustomSliverGridViewBuilder extends StatelessWidget {
  const CustomSliverGridViewBuilder({
    super.key,
    required this.data,
    required this.cubit,
  });

  final List<BaseCardModel> data;
  final BasePaginatedCubit cubit;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SliverGrid.builder(
      key: const PageStorageKey('film_list'),
      itemCount: data.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > SizeConfig.mobile ? 4 : 3,
        childAspectRatio: width > SizeConfig.mobile ? 0.6 : 0.5,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index == data.length) {
          return LoadingBlocBuilder(cubit: cubit);
        }
        return MainVerticalCard(cardModel: data[index]);
      },
    );
  }
}
