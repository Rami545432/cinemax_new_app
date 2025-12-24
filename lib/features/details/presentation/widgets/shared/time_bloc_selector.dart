import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_time_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/fetch_details_cubit/fetch_details_cubit.dart';
import '../../cubits/fetch_details_cubit/fetch_details_state.dart';

class TimeBlocSelector extends StatelessWidget {
  const TimeBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FetchDetailsCubit, FetchDetailsState, int>(
      selector: (state) {
        return state.maybeWhen(
          orElse: () => 0,
          successMovie: (movie) => movie.duration,
        );
      },
      builder: (context, duration) {
        if (duration == 0) {
          return const SizedBox.shrink();
        }
        final formattedDuration = formmatTime(duration);
        return Text(formattedDuration, style: AppStyles.textStyle16(context));
      },
    );
  }
}
