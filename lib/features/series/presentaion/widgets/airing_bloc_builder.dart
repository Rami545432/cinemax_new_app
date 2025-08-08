import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper/base_pagination_cubit/base_paginated_states.dart';
import '../../../../models/base_card_model.dart';
import '../../../home/presentaion/views_models/widgets/sub_bar_and_main_card.dart';
import '../manger/fetch_airing_today_cubit/fetch_airing_today_cubit.dart';

class AiringTodayBLocBuilder extends StatelessWidget {
  const AiringTodayBLocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FetchAiringTodayCubit,
      BasePaginatedStates<BaseCardModel>
    >(
      builder: (context, state) {
        if (state is BasePaginatedSuccess<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.newData,
            title: 'Airing Today ',
            type: 'tv',
            cubitType: context.read<FetchAiringTodayCubit>(),
          );
        } else if (state is BasePaginatedError<BaseCardModel>) {
          return Text(state.errorMessage);
        } else if (state is BasePaginatedLoading<BaseCardModel>) {
          return SubBarAndMainCard(
            data: state.oldData,
            title: 'Airing Today ',
            type: 'tv',
            cubitType: context.read<FetchAiringTodayCubit>(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
