import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_history.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  GetSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<List<SearchHistoryEntity>> call() =>
      searchHistoryRepo.getSearchHistory();
}
