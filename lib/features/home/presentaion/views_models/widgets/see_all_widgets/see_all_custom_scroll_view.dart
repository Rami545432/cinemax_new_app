import 'package:flutter/material.dart';

import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import '../../../../../../models/base_card_model.dart';
import '../../../../../../models/see_all_arguments_model.dart';
import 'custom_sliver_app_bar.dart';
import 'custom_sliver_grid_builder.dart';

class SeeAllCustomScrollView extends StatelessWidget {
  const SeeAllCustomScrollView({
    super.key,
    required this.seeAllArgumentsModel,
    required this.data,
    required this.scrollController,
    required this.cubit,
  });

  final SeeAllArgumentsModel seeAllArgumentsModel;
  final List<BaseCardModel> data;
  final ScrollController scrollController;
  final BasePaginatedCubit cubit;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        CustomSliverAppBar(seeAllArgumentsModel: seeAllArgumentsModel),
        SliverPadding(
          padding: EdgeInsets.only(top: 16),
          sliver: CustomSliverGridViewBuilder(data: data, cubit: cubit),
        ),
      ],
    );
  }
}
