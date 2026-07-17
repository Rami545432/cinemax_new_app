import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/network/utils/safe_emit_state.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_series_season_details.dart';
import 'package:movify/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_state.dart';

class FetchSeriesSeasonDetailsCubit
    extends Cubit<FetchSeriesSeasonDetailsState> {
  FetchSeriesSeasonDetailsCubit(this.fetchSeriesSeasonDetails)
    : super(const FetchSeriesSeasonDetailsState.initial());
  final FetchSeriesSeasonDetailsUseCase fetchSeriesSeasonDetails;
  Future<void> fetchSeriesSeasonDetail({
    required int tvid,
    required int season,
  }) async {
    safeEmit(const FetchSeriesSeasonDetailsState.loading());
    final data = await fetchSeriesSeasonDetails.call(tvid, season);
    data.fold(
      (failure) {
        safeEmit(FetchSeriesSeasonDetailsState.failure(failure.errorMessage));
      },
      (seasons) {
        safeEmit(FetchSeriesSeasonDetailsState.success(seasons));
      },
    );
  }

  void emitPreloadedData(SeriesSeasonDetailsEntity data) {
    safeEmit(FetchSeriesSeasonDetailsState.success(data));
  }
}
