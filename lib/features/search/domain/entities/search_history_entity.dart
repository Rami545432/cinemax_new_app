import 'package:cinemax_app_new/core/utils/enums/content_type.dart';

class SearchHistoryEntity {
  final int id;
  final String title;
  final String posterPath;
  final ContentType historyContentType;
  final DateTime searchedAt;
  final double rating;
  final String date;

  const SearchHistoryEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.historyContentType,
    required this.searchedAt,
    required this.rating,
    required this.date,
  });
}
