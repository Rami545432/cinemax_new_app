import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/details/domain/use_cases/details_params.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_state.dart';
import 'package:movify/features/details/presentation/widgets/shared/movie_details_componets.dart';
import 'package:movify/features/details/presentation/widgets/shared/series_details_compoents.dart';
import 'package:movify/shared/presentation/widgets/retry_button.dart';
import 'package:provider/provider.dart';

class BuildDetailsBodyContent extends StatelessWidget {
  const BuildDetailsBodyContent({
    super.key,
    required this.id,
    required this.contentType,
  });
  final int id;
  final ContentType contentType;

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<FetchDetailsCubit, FetchDetailsState>(
    builder: (context, state) => state.when(
      initial: () => const SizedBox(),
      loading: () => Center(
        child: RepaintBoundary(
          child: CircularProgressIndicator(color: AppPrimaryColors.blueAccent),
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
          child: Text(errMessage ?? 'An error occurred while fetching details'),
        );
      },
      successMovie: (movies) =>
          Provider.value(value: movies, child: const MovieDetailComponets()),
      successSeries: (series) =>
          Provider.value(value: series, child: const SeriesDetailsCompoents()),
    ),
  );
}
