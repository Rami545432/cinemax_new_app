import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/core/utils/retry_button.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../cubits/fetch_details_cubit/fetch_details_cubit.dart';
import '../../cubits/fetch_details_cubit/fetch_details_state.dart';
import 'movie_details_componets.dart';
import 'series_details_compoents.dart';

class BuildBodyContent extends StatelessWidget {
  const BuildBodyContent({
    super.key,
    required this.id,
    required this.contentType,
  });
  final int id;
  final ContentType contentType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDetailsCubit, FetchDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: AppPrimaryColors.blueAccent,
            ),
          ),
          failure: (errMessage) {
            final connectivityCubit = context.read<ConnectivityCubit>();
            if (connectivityCubit.isOffline) {
              return RetryButton(
                onRetry: () {
                  context.read<FetchDetailsCubit>().fetchDetails(
                    DetailsParams(id: id, type: contentType.text),
                  );
                },
              );
            }
            return Center(
              child: Text(
                errMessage ?? 'An error occurred while fetching details',
              ),
            );
          },
          successMovie: (movies) =>
              Provider.value(value: movies, child: MovieDetailComponets()),
          successSeries: (series) =>
              Provider.value(value: series, child: SeriesDetailsCompoents()),
        );
      },
    );
  }
}
