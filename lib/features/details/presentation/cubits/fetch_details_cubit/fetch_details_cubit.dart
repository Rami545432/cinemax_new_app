import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/network/utils/safe_emit_state.dart';
import 'package:movify/features/details/domain/use_cases/details_params.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_movie_details_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_tv_show_details_use_case.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_state.dart';

class FetchDetailsCubit extends Cubit<FetchDetailsState> {
  FetchDetailsCubit({
    required this.fetchMovieDetailsUseCase,
    required this.fetchTvShowDetailsUseCase,
  }) : super(const FetchDetailsState.initial());

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  final FetchTvShowDetailsUseCase fetchTvShowDetailsUseCase;

  Future<void> fetchDetails(DetailsParams params) async {
    safeEmit(const FetchDetailsState.loading());
    switch (params.type) {
      case 'movie':
        final data = await fetchMovieDetailsUseCase.call(params);
        data.fold(
          (failure) {
            safeEmit(FetchDetailsState.failure(failure.errorMessage));
          },
          (movie) {
            safeEmit(FetchDetailsState.successMovie(movie));
          },
        );
        break;
      case 'tv':
        final data = await fetchTvShowDetailsUseCase.call(params);
        data.fold(
          (failure) {
            safeEmit(FetchDetailsState.failure(failure.errorMessage));
          },
          (series) {
            safeEmit(FetchDetailsState.successSeries(series));
          },
        );
        break;
    }
  }
}
