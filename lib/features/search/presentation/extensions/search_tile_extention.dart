import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

extension SearchTileExtensionX on SearchHistoryEntity {
  CardDisplayModel toCardDisplay() => CardDisplayModel(
    id: id,
    title: title,
    posterPath: posterPath,
    contentType: historyContentType,
    date: date,
    rating: rating,
  );
}

extension SearchTileListX on List<SearchHistoryEntity> {
  List<CardDisplayModel> toCardDispalys() =>
      map((e) => e.toCardDisplay()).toList();
}
