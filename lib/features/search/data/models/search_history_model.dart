import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';
import 'package:hive/hive.dart';

part 'search_history_model.g.dart';

@HiveType(typeId: 2)
class SearchHistoryModel {
  @HiveField(0)
  final String query;
  @HiveField(1)
  final DateTime searchedAt;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final ContentType historyContentType;
  @HiveField(5)
  final double rating;
  @HiveField(6)
  final String date;

  SearchHistoryModel({
    required this.query,
    required this.searchedAt,
    required this.posterPath,
    required this.id,
    required this.historyContentType,
    required this.rating,
    required this.date,
  });
  SearchHistoryEntity toEntity() => SearchHistoryEntity(
    id: id,
    title: query,
    searchedAt: searchedAt,
    posterPath: posterPath,
    historyContentType: historyContentType,
    rating: rating,
    date: date,
  );
  factory SearchHistoryModel.fromEntity(SearchHistoryEntity entity) =>
      SearchHistoryModel(
        id: entity.id,
        query: entity.title,
        searchedAt: entity.searchedAt,
        posterPath: entity.posterPath,
        historyContentType: entity.historyContentType,
        rating: entity.rating,
        date: entity.date,
      );
}
