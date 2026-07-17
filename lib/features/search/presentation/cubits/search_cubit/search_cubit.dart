import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movify/core/network/utils/safe_emit_state.dart';
import 'package:movify/core/utils/sorting_methods.dart';
import 'package:movify/features/search/data/models/search_result.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/domain/use_cases/add_to_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/clear_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/delete_from_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/search_movie_use_case.dart';
import 'package:movify/features/search/domain/use_cases/search_tv_show_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchMovieUseCase,
    this.searchTvShowUseCase,
    this.addToHistoryUseCase,
    this.clearSearchHistoryUseCase,
    this.deleteFromSearchHistoryUseCase,
    this.getSearchHistoryUseCase,
  ) : super(SearchInitial());
  final SearchMovieUseCase searchMovieUseCase;
  final SearchSeriesUseCase searchTvShowUseCase;
  final AddSearchHistoryUseCase addToHistoryUseCase;
  final ClearSearchHistoryUseCase clearSearchHistoryUseCase;
  final DeleteSearchHistoryUseCase deleteFromSearchHistoryUseCase;
  final GetSearchHistoryUseCase getSearchHistoryUseCase;

  Future<void> searchItems(String query) async {
    final movieResult = await searchMovieUseCase.call(query);
    final tvShowsResults = await searchTvShowUseCase.call(query);

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

  Future<void> addToSearchHistory(SearchHistoryEntity searchHistory) async {
    await addToHistoryUseCase.call(searchHistory);
  }

  Future<void> clearSearchHistory() async {
    await clearSearchHistoryUseCase.call();
    getSearchHistory();
  }

  Future<void> deleteSearchHistory(int id) async {
    await deleteFromSearchHistoryUseCase.call(id);
    getSearchHistory();
  }

  Future<void> getSearchHistory() async {
    final searchHistory = await getSearchHistoryUseCase.call();
    safeEmit(SearchHistorySuccess(searchHistory: searchHistory));
  }
}
