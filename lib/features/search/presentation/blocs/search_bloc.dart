// lib/features/search/bloc/search_bloc.dart
import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/sorting_methods.dart';
import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/search_movie_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/search_tv_show_use_case.dart';
import 'package:cinemax_app_new/features/search/presentation/blocs/search_events.dart';
import 'package:cinemax_app_new/features/search/presentation/blocs/search_states.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart'; // for debounce

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovieUseCase _searchMovieUseCase;
  final SearchSeriesUseCase _searchSeriesUseCase;

  SearchBloc({
    required SearchMovieUseCase searchMovieUseCase,
    required SearchSeriesUseCase searchSeriesUseCase,
  }) : _searchMovieUseCase = searchMovieUseCase,
       _searchSeriesUseCase = searchSeriesUseCase,
       super(const SearchInitial()) {
    on<SearchQueryChanged>(
      _onQueryChanged,
      transformer: _debounceRestartable(),
    );
    on<SearchCleared>((_, emit) => emit(const SearchInitial()));
  }

  EventTransformer<SearchQueryChanged> _debounceRestartable() =>
      (events, mapper) =>
          events.debounce(const Duration(milliseconds: 500)).switchMap(mapper);

  Future<void> _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(const SearchInitial());
      return;
    }

    emit(const SearchLoading());

    try {
      // ✅ Both API calls fire simultaneously
      final results = await Future.wait([
        _searchMovieUseCase.call(event.query),
        _searchSeriesUseCase.call(event.query),
      ]);

      final movieEither = results[0] as Either<Failure, List<MovieEntity>>;
      final tvShowEither = results[1] as Either<Failure, List<SeriesEntity>>;

      // ✅ Handle failures first, cleanly
      if (movieEither.isLeft()) {
        emit(
          SearchError(
            errorMessage: movieEither.fold((f) => f.errorMessage, (_) => ''),
          ),
        );
        return;
      }
      if (tvShowEither.isLeft()) {
        emit(
          SearchError(
            errorMessage: tvShowEither.fold((f) => f.errorMessage, (_) => ''),
          ),
        );
        return;
      }

      // ✅ Both succeeded — extract data
      final movies = movieEither.getOrElse(() => []);
      final tvShows = tvShowEither.getOrElse(() => []);

      // ✅ Sort once per list, not 3 times
      final sortedMovies = sortSearchResultsByRatingAndDate(
        movies.map((m) => MovieResult(m)).toList(),
      );
      final sortedTvShows = sortSearchResultsByRatingAndDate(
        tvShows.map((t) => TvShowResult(t)).toList(),
      );

      emit(
        SearchLoaded(
          results: [...sortedMovies, ...sortedTvShows],
          movies: sortedMovies,
          tvShows: sortedTvShows,
        ),
      );
    } catch (e) {
      emit(const SearchError(errorMessage: 'Something went wrong'));
    }
  }
}
