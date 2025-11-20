import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_tv_show_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fetch_details_state.dart';

class FetchDetailsCubit extends Cubit<FetchDetailsState> {
  FetchDetailsCubit({
    required this.fetchMovieDetailsUseCase,
    required this.fetchTvShowDetailsUseCase,
  }) : super(const FetchDetailsState.initial());

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  final FetchTvShowDetailsUseCase fetchTvShowDetailsUseCase;

  Future<void> fetchDetails(DetailsParams params) async {
    safeEmit(FetchDetailsState.loading());
    if (params.type == 'movie') {
      final data = await fetchMovieDetailsUseCase.call(params);
      data.fold(
        (failure) {
          safeEmit(FetchDetailsState.failure(failure.errorMessage));
        },
        (movie) {
          safeEmit(FetchDetailsState.successMovie(movie));
        },
      );
    } else if (params.type == 'tv') {
      final data = await fetchTvShowDetailsUseCase.call(params);
      data.fold(
        (failure) {
          safeEmit(FetchDetailsState.failure(failure.errorMessage));
        },
        (series) {
          safeEmit(FetchDetailsState.successSeries(series));
        },
      );
    }
  }
}
