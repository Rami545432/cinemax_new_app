import 'package:cinemax_app_new/core/utils/helper/formatted_methods/formatted_time_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocSelector;

import '../../../../search/presentaion/view_models/widgets/icon_text_row.dart';
import '../../cubits/fetch_details_cubit/fetch_details_cubit.dart';
import '../../cubits/fetch_details_cubit/fetch_details_state.dart';

class DurationBlocSelector extends StatelessWidget {
  const DurationBlocSelector({super.key});

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
        final formattedDuration = formmatTime(duration);
        return IconTextRow(
          text: formattedDuration,
          iconData: Icons.access_time_filled_outlined,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
