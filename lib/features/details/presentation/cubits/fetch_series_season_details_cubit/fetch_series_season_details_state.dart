import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movify/features/details/domain/entites/series_season_details_entitiy.dart';

part 'fetch_series_season_details_state.freezed.dart';

@freezed
class FetchSeriesSeasonDetailsState with _$FetchSeriesSeasonDetailsState {
  const factory FetchSeriesSeasonDetailsState.initial() = _Initial;
  const factory FetchSeriesSeasonDetailsState.loading() = _Loading;
  const factory FetchSeriesSeasonDetailsState.failure(String? message) =
      _Failure;
  const factory FetchSeriesSeasonDetailsState.success(
    SeriesSeasonDetailsEntity series,
  ) = _Success;
}
