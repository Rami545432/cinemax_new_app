import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entites/series_details_entity.dart';
import '../../../domain/entites/movie_details_entity.dart';

part 'fetch_details_state.freezed.dart';

@freezed
class FetchDetailsState with _$FetchDetailsState {
  const factory FetchDetailsState.initial() = _Initial;
  const factory FetchDetailsState.loading() = _Loading;
  const factory FetchDetailsState.failure(String? message) = _Failure;
  const factory FetchDetailsState.successMovie(MovieDetailsEntity movie) =
      _SuccessMovie;

  const factory FetchDetailsState.successSeries(SeriesDetailsEntity series) =
      _SuccessSeries;
}
