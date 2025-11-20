import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_series_season_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fetch_series_season_details_state.dart';

class FetchSeriesSeasonDetailsCubit
    extends Cubit<FetchSeriesSeasonDetailsState> {
  FetchSeriesSeasonDetailsCubit(this.fetchSeriesSeasonDetails)
    : super(FetchSeriesSeasonDetailsState.initial());
  final FetchSeriesSeasonDetailsUseCase fetchSeriesSeasonDetails;
  Future<void> fetchSeriesSeasonDetail({
    required int tvid,
    required int season,
  }) async {
    emit(FetchSeriesSeasonDetailsState.loading());
    var data = await fetchSeriesSeasonDetails.call(tvid, season);
    data.fold(
      (failure) {
        emit(FetchSeriesSeasonDetailsState.failure(failure.errorMessage));
      },
      (seasons) {
        emit(FetchSeriesSeasonDetailsState.success(seasons));
      },
    );
  }

  void emitPreloadedData(SeriesSeasonDetailsEntitiy data) {
    emit(FetchSeriesSeasonDetailsState.success(data));
  }
}
