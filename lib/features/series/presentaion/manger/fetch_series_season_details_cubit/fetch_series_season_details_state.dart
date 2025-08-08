import 'package:cinemax_app_new/features/series/domain/entites/series_season_details_entitiy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'fetch_series_season_details_state.freezed.dart';

@freezed
class FetchSeriesSeasonDetailsState with _$FetchSeriesSeasonDetailsState {
  const factory FetchSeriesSeasonDetailsState.initial() = _Initial;
  const factory FetchSeriesSeasonDetailsState.loading() = _Loading;
  const factory FetchSeriesSeasonDetailsState.failure(String? message) =
      _Failure;
  const factory FetchSeriesSeasonDetailsState.success(
    SeriesSeasonDetailsEntitiy series,
  ) = _Success;
}
