import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';

import '../../data/models/search_history_model.dart';

class SearchHistoryUseCase {
  final SearchRepo searchRepo;

  SearchHistoryUseCase({required this.searchRepo});

  Future<List<SearchHistoryModel>> getSearchHistory() async {
    return await searchRepo.getSearchHistory();
  }

  Future<void> addToSearchHistory(SearchHistoryModel searchHistory) async {
    await searchRepo.addToSearchHistory(searchHistory);
  }

  Future<void> clearSearchHistory() async {
    await searchRepo.clearSearchHistory();
  }

  Future<void> deleteSearchHistory(int id) async {
    await searchRepo.deleteSearchHistory(id);
  }
}
