import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/base_card_model.dart';
import 'helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'helper/base_pagination_cubit/base_paginated_states.dart';

class LoadingBlocBuilder extends StatelessWidget {
  const LoadingBlocBuilder({super.key, required this.cubit});

  final BasePaginatedCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      BasePaginatedCubit<BaseCardModel, dynamic>,
      BasePaginatedStates<BaseCardModel>
    >(
      bloc: cubit as BasePaginatedCubit<BaseCardModel, dynamic>,
      builder: (context, state) {
        final isLoadingMore =
            state is BasePaginatedLoading<BaseCardModel> && !state.isFirstFetch;

        if (isLoadingMore) {
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 12),
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        return const SizedBox.shrink(); // Empty when not loading
      },
    );
  }
}
