import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_state.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/season/season_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SeasonTabsBlocBuilder extends StatelessWidget {
  const SeasonTabsBlocBuilder({super.key, required this.seiresPosterPath});
  final String seiresPosterPath;
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FetchSeriesSeasonDetailsCubit, FetchSeriesSeasonDetailsState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (message) => Center(
            child: Text(
              message ?? 'Error',
              style: AppStyles.textStyle18(context),
            ),
          ),
          success: (data) => Provider.value(
            value: data,
            child: SeasonTabs(seiresPosterPath: seiresPosterPath),
          ),
        ),
      );
}
