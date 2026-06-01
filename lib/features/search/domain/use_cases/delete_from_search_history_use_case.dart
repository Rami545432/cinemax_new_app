import 'package:movify/features/search/domain/repo/search_history.dart';

class DeleteSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  DeleteSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call(int id) => searchHistoryRepo.deleteFromSearchHistory(id);
}
