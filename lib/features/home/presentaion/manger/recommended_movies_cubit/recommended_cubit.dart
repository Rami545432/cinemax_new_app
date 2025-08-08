import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domian/uses_cases/fetch_recommended_use_case.dart';

import 'recommended_state.dart';

class FetchRecommendedCubit extends Cubit<RecommendedState> {
  FetchRecommendedCubit(this.fetchRecommendedMoviesUseCase)
    : super(const RecommendedState.initial());

  final FetchRecommendedUseCase fetchRecommendedMoviesUseCase;

  Future<void> fetchData(int moiveId, String type) async {
    var results = await fetchRecommendedMoviesUseCase.call(moiveId, type);
    results.fold(
      (failure) {
        emit(RecommendedState.failure(failure.errorMessage));
      },
      (data) {
        emit(RecommendedState.success(data));
      },
    );
  }
}
