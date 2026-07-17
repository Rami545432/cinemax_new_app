import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocSelector;
import 'package:movify/core/formatters/formatted_time_method.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_state.dart';
import 'package:movify/features/search/presentation/widgets/icon_text_row.dart';

class DurationBlocSelector extends StatelessWidget {
  const DurationBlocSelector({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<FetchDetailsCubit, FetchDetailsState, int>(
        selector: (state) => state.maybeWhen(
          orElse: () => 0,
          successMovie: (movie) => movie.duration,
        ),
        builder: (context, duration) {
          final formattedDuration = formmatTime(duration, context);
          return IconTextRow(
            text: formattedDuration,
            iconData: Icons.access_time_filled_outlined,
            mainAxisAlignment: MainAxisAlignment.center,
          );
        },
      );
}
