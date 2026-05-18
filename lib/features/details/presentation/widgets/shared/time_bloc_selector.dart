import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/formatters/formatted_time_method.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_state.dart';

class TimeBlocSelector extends StatelessWidget {
  const TimeBlocSelector({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<FetchDetailsCubit, FetchDetailsState, int>(
        selector: (state) => state.maybeWhen(
          orElse: () => 0,
          successMovie: (movie) => movie.duration,
        ),
        builder: (context, duration) {
          if (duration == 0) {
            return const SizedBox.shrink();
          }
          final formattedDuration = formmatTime(duration, context);
          return Text(formattedDuration, style: AppStyles.textStyle16(context));
        },
      );
}
