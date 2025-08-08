import 'package:flutter/material.dart';

import '../../../../../core/utils/loading_bloc_builder.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../models/base_card_model.dart';
import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'main_vertical_card.dart';

class FilmCardListView extends StatelessWidget {
  const FilmCardListView({
    super.key,
    required this.data,
    required this.scrollController,
    required this.cubit,
  });
  final List<BaseCardModel> data;
  final ScrollController scrollController;
  final BasePaginatedCubit cubit;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: width > SizeConfig.mobile ? 3 : 1.45,
      child: ListView.builder(
        key: const PageStorageKey('film_list'),
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: data.length + 1,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == data.length) {
            return LoadingBlocBuilder(cubit: cubit);
          }
          final model = data[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MainVerticalCard(cardModel: model),
          );
        },
      ),
    );
  }
}
