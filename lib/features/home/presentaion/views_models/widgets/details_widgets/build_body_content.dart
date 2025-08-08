import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manger/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';
import '../../../manger/fetch_movie_details_cubit/fetch_movie_details_state.dart';
import 'movie_details_componets.dart';
import 'series_details_compoents.dart';

class BuildBodyContent extends StatelessWidget {
  const BuildBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDetailsCubit, FetchDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (errMessage) => Center(
            child: Text(
              errMessage ?? 'An error occurred while fetching details',
            ),
          ),
          successMovie: (movies) =>
              MovieDetailComponets(movieDetailsEntity: movies),
          successSeries: (series) =>
              SeriesDetailsCompoents(seriesDetailsEntity: series),
        );
      },
    );
  }
}
