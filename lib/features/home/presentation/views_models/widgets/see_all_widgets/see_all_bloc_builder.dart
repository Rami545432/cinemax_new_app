import 'package:cinemax_app_new/features/home/data/models/see_all_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../../models/base_card_model.dart';
import '../../../cubit/see_all_cubit/see_all_cubit.dart';
import 'see_all_custom_scroll_view.dart';

class SeeAllBlocBuilder extends StatelessWidget {
  const SeeAllBlocBuilder({
    super.key,
    required this.seeAllArgumentsModel,
    required this.scrollController,
  });
  final SeeAllArgumentsModel seeAllArgumentsModel;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllCubit, BasePaginatedStates<BaseCardModel>>(
      builder: (context, state) {
        final isLoadingMore =
            state is BasePaginatedLoading<BaseCardModel> && !state.isFirstFetch;
        List<BaseCardModel> data = [];

        if (state is BasePaginatedSuccess<BaseCardModel>) {
          data = state.newData;
        } else if (state is BasePaginatedLoading<BaseCardModel>) {
          data = state.oldData;
        } else if (state is BasePaginatedError<BaseCardModel>) {
          data = state.oldData;
        } else {
          return Container();
        }

        return Provider.value(
          value: data,
          child: SeeAllCustomScrollView(
            seeAllArgumentsModel: seeAllArgumentsModel,
            cubit: context.read<SeeAllCubit>(),
            isLoadingMore: isLoadingMore,
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}
