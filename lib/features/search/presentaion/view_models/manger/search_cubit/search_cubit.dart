import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/core/utils/helper/sorting_methods.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/search_history_model.dart';
import '../../../../data/models/search_result.dart';

import '../../../../domain/use_case/search_history_use_case.dart';
import '../../../../domain/use_case/search_movie_use_case.dart';
import '../../../../domain/use_case/search_tv_show_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchMovieUseCase,
    this.searchTvShowUseCase,
    this.searchHistoryUseCase,
  ) : super(SearchInitial());
  final SearchMovieUseCase searchMovieUseCase;
  final SearchTvShowUseCase searchTvShowUseCase;
  final SearchHistoryUseCase searchHistoryUseCase;
  CancelToken? cancelToken;

  Future<void> searchItems(String query) async {
    cancelToken?.cancel();
    cancelToken = CancelToken();
    var movieResult = await searchMovieUseCase.call(query, cancelToken);
    var tvShowsResults = await searchTvShowUseCase.call(query, cancelToken);

    movieResult.fold(
      (failure) {
        safeEmit(SearchFailure(errorMessage: failure.errorMessage));
      },
      (movies) {
        tvShowsResults.fold(
          (failure) {
            safeEmit(SearchFailure(errorMessage: failure.errorMessage));
          },
          (tvshows) {
            final combinedResults = <SearchResult>[
              ...movies.map((movie) => MovieResult(movie)),
              ...tvshows.map((tvshow) => TvShowResult(tvshow)),
            ];
            final sortedResults = sortSearchResultsByRatingAndDate(
              combinedResults,
            );
            final sortedMoviesResults = sortSearchResultsByRatingAndDate(
              movies.map((movie) => MovieResult(movie)).toList(),
            );
            final sortedTvShowsResults = sortSearchResultsByRatingAndDate(
              tvshows.map((tvshow) => TvShowResult(tvshow)).toList(),
            );

            safeEmit(
              SearchSuccess(
                results: sortedResults,
                movies: sortedMoviesResults,
                tvShows: sortedTvShowsResults,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> addToSearchHistory(SearchHistoryModel searchHistory) async {
    await searchHistoryUseCase.addToSearchHistory(searchHistory);
  }

  Future<void> clearSearchHistory() async {
    await searchHistoryUseCase.clearSearchHistory();
    getSearchHistory();
  }

  Future<void> deleteSearchHistory(int id) async {
    await searchHistoryUseCase.deleteSearchHistory(id);
    getSearchHistory();
  }

  Future<void> getSearchHistory() async {
    final searchHistory = await searchHistoryUseCase.getSearchHistory();
    safeEmit(SearchHistorySuccess(searchHistory: searchHistory));
  }

  @override
  Future<void> close() {
    cancelToken?.cancel();
    return super.close();
  }
}
