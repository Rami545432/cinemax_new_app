import 'package:cinemax_app_new/features/search/domain/repo/search_history.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  ClearSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call() => searchHistoryRepo.clearSearchHistory();
}
