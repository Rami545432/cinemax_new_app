import 'package:injectable/injectable.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/domain/repo/search_history.dart';

@lazySingleton
class AddSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  AddSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call(SearchHistoryEntity parameter) =>
      searchHistoryRepo.addToSearchHistory(parameter);
}
