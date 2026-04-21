import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/add_to_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/clear_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/delete_from_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/presentation/cubits/search_history_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  final GetSearchHistoryUseCase getSearchHistoryUseCase;
  final AddSearchHistoryUseCase addToHistoryUseCase;
  final DeleteSearchHistoryUseCase deleteFromSearchHistoryUseCase;
  final ClearSearchHistoryUseCase clearSearchHistoryUseCase;
  SearchHistoryCubit(
    this.getSearchHistoryUseCase,
    this.addToHistoryUseCase,
    this.deleteFromSearchHistoryUseCase,
    this.clearSearchHistoryUseCase,
  ) : super(const SearchHistoryInitial()); // zero dependencies

  Future<void> getSearchHistory() async {
    final searchHistory = await getSearchHistoryUseCase.call();
    safeEmit(SearchHistoryLoaded(searchHistory: searchHistory));
  }

  Future<void> addToHistory(SearchHistoryEntity searchHistory) async {
    await addToHistoryUseCase.call(searchHistory);
    getSearchHistory();
  }

  Future<void> deleteFromHistory(int id) async {
    await deleteFromSearchHistoryUseCase.call(id);
    getSearchHistory();
  }

  Future<void> clearHistory() async {
    await clearSearchHistoryUseCase.call();
    getSearchHistory();
  }
}
