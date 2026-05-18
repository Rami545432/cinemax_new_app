// presentation/models/card_display_model.dart
// ✅ Pure Dart — no Flutter imports, no abstract
import 'package:movify/core/utils/enums/content_type.dart';

final class CardDisplayModel {
  final int id;
  final String title;
  final String posterPath;
  final String? backdropPath;
  final double? rating;
  final List<int>? genreIds;
  final String? date;
  final num? popularity;
  final ContentType contentType;

  const CardDisplayModel({
    required this.id,
    required this.title,
    required this.posterPath,
    this.backdropPath,
    this.rating,
    this.genreIds,
    this.date,
    this.popularity,
    required this.contentType,
  });
}
