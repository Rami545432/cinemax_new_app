import 'package:cinemax_app_new/features/search/domain/repo/search_history.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  DeleteSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call(int id) => searchHistoryRepo.deleteFromSearchHistory(id);
}
