import '../core/utils/enums/content_type.dart';

class BaseCardModel {
  final int cardId;
  final String cardTitle;
  final String? cardDate;
  final num? cardRating;
  final String cardImage;
  final String? horizontalCardImage;
  final String? type;
  final List<int>? cardGeners;
  final num? cardPopularity;
  final ContentType? contentType;

  const BaseCardModel({
    required this.cardId,
    required this.cardTitle,
    this.cardRating,
    required this.cardImage,
    this.cardDate,
    this.type,
    this.horizontalCardImage,
    this.cardGeners,
    this.cardPopularity,
    this.contentType,
  });
}
