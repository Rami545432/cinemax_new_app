import 'package:movify/features/search/data/data_sources/local/local_search_history_data_source.dart';
import 'package:movify/features/search/data/models/search_history_model.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/domain/repo/search_history.dart';

class SearchHistoryRepoImpl implements SearchHistoryRepo {
  final LocalSearchHistoryDataSource localSearchDataSource;

  SearchHistoryRepoImpl({required this.localSearchDataSource});
  @override
  Future<void> addToSearchHistory(SearchHistoryEntity searchHistory) async {
    final model = SearchHistoryModel.fromEntity(searchHistory);
    await localSearchDataSource.addToSearchHistory(model);
  }

  @override
  Future<void> clearSearchHistory() async {
    await localSearchDataSource.clearSearchHistory();
  }

  @override
  Future<List<SearchHistoryEntity>> getSearchHistory() async {
    final models = await localSearchDataSource.getSearchHistory();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> deleteFromSearchHistory(int id) =>
      localSearchDataSource.deleteFromSearchHistory(id);
}
