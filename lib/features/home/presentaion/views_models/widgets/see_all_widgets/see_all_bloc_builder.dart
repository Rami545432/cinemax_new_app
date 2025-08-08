import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../../../models/base_card_model.dart';
import '../../../../../../models/see_all_arguments_model.dart';
import '../../../manger/see_all_cubit/see_all_cubit.dart';
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
        List<BaseCardModel> data = [];

        if (state is BasePaginatedSuccess<BaseCardModel>) {
          data = state.newData;
        } else if (state is BasePaginatedLoading<BaseCardModel>) {
          data = state.oldData;
        } else if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        } else {
          return Container();
        }

        return SeeAllCustomScrollView(
          seeAllArgumentsModel: seeAllArgumentsModel,
          data: data,
          scrollController: scrollController,
          cubit: context.read<SeeAllCubit>(),
        );
      },
    );
  }
}
