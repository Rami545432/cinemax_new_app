import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manger/recommended_movies_cubit/recommended_cubit.dart';
import '../../../manger/recommended_movies_cubit/recommended_state.dart';
import 'custom_grid_view_builder.dart';

class RecomendedTabBarView extends StatelessWidget {
  const RecomendedTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRecommendedCubit, RecommendedState>(
      builder: (context, state) {
        return state.when(
          initial: () => SizedBox(),
          loading: () => Center(child: CircularProgressIndicator()),
          failure: (message) => Text(message),
          success: (data) => CustomGridView(data: data),
        );
      },
    );
  }
}
