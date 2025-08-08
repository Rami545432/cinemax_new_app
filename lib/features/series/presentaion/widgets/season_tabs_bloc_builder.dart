import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import '../manger/fetch_series_season_details_cubit/fetch_series_season_details_state.dart';
import 'season_tabs.dart';

class SeasonTabsBlocBuilder extends StatelessWidget {
  const SeasonTabsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSeriesSeasonDetailsCubit,
        FetchSeriesSeasonDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => SizedBox(),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          failure: (message) => Center(
            child: Text(
              message ?? 'Error',
              style: AppStyles.textStyle18(context),
            ),
          ),
          success: (data) => SeasonTabs(
            data: data,
          ),
        );
      },
    );
  }
}
