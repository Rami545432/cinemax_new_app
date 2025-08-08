import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cubit_parameters/params.dart';
import '../../../../../core/utils/errors/errors.dart';
import '../../../../series/domain/use_cases/fetch_tv_show_details_use_case.dart';
import '../../../domian/uses_cases/fetch_movie_details.dart';
import 'fetch_movie_details_state.dart';

class FetchDetailsCubit extends Cubit<FetchDetailsState> {
  FetchDetailsCubit(
    this.fetchMovieDetailsUseCase,
    this.fetchTvShowDetailsUseCase,
  ) : super(const FetchDetailsState.initial());

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  final FetchTvShowDetailsUseCase fetchTvShowDetailsUseCase;

  Future<void> fetchDetails(DetailsParams params) async {
    Either<Failure, dynamic> data;
    if (params.type == 'movie') {
      data = await fetchMovieDetailsUseCase.call(params);
      data.fold(
        (failure) {
          emit(FetchDetailsState.failure(failure.errorMessage));
        },
        (movie) {
          emit(FetchDetailsState.successMovie(movie));
        },
      );
    } else if (params.type == 'tv') {
      data = await fetchTvShowDetailsUseCase.call(params);
      data.fold(
        (failure) {
          emit(FetchDetailsState.failure(failure.errorMessage.toString()));
        },
        (series) {
          emit(FetchDetailsState.successSeries(series));
        },
      );
    }
  }
}
