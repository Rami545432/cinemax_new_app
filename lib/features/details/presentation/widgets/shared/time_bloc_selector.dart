import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocSelector;

import '../../../../search/presentaion/view_models/widgets/icon_text_row.dart';
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
        return IconTextRow(
          text: "$duration Min",
          iconData: Icons.access_time_filled_outlined,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
