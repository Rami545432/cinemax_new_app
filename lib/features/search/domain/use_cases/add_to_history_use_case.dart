import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_history.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddSearchHistoryUseCase {
  final SearchHistoryRepo searchHistoryRepo;

  AddSearchHistoryUseCase({required this.searchHistoryRepo});

  Future<void> call(SearchHistoryEntity parameter) =>
      searchHistoryRepo.addToSearchHistory(parameter);
}
