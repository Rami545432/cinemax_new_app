import 'package:injectable/injectable.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/domain/repo/search_history.dart';

@lazySingleton
class GetSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  GetSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<List<SearchHistoryEntity>> call() =>
      searchHistoryRepo.getSearchHistory();
}
