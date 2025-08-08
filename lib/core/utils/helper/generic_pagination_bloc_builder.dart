import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/card_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_pagination_cubit/base_paginated_cubit.dart';
import 'base_pagination_cubit/base_paginated_states.dart';
import '../../../models/base_card_model.dart';
import '../../../features/home/presentaion/views_models/widgets/sub_bar_and_main_card.dart';

class GenericPaginationBlocBuilder<
  T extends BasePaginatedCubit<BaseCardModel, dynamic>
>
    extends StatelessWidget {
  const GenericPaginationBlocBuilder({
    super.key,
    required this.title,
    required this.type,
  });

  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, BasePaginatedStates<BaseCardModel>>(
      builder: (context, state) {
        List<BaseCardModel> data = [];

        if (state is BasePaginatedSuccess<BaseCardModel>) {
          data = state.newData;
        } else if (state is BasePaginatedLoading<BaseCardModel>) {
          data = state.oldData;
        } else if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        } else {
          return const CardListViewLoading();
        }

        return SubBarAndMainCard(
          data: data,
          title: title,
          type: type,
          cubitType: context.read<T>(),
        );
      },
    );
  }
}
