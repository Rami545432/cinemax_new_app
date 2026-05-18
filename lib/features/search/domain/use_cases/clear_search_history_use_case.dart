import 'package:injectable/injectable.dart';
import 'package:movify/features/search/domain/repo/search_history.dart';

@lazySingleton
class ClearSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  ClearSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call() => searchHistoryRepo.clearSearchHistory();
}
