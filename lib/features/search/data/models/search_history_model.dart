import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/enums/content_type.dart' show ContentType;

part 'search_history_model.g.dart';

@HiveType(typeId: 2)
class SearchHistoryModel implements BaseCardModel {
  @HiveField(0)
  final String query;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final String historyType;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String historyHorizontalCardImage;
  @HiveField(5)
  final String historyVerticalCardImage;

  SearchHistoryModel({
    required this.query,
    required this.createdAt,
    required this.historyType,
    required this.id,
    required this.historyHorizontalCardImage,
    required this.historyVerticalCardImage,
  });

  @override
  String? get cardDate => createdAt.toString();

  @override
  List<int>? get cardGeners => null;

  @override
  int get cardId => id;

  @override
  String get cardImage => historyVerticalCardImage;

  @override
  num? get cardPopularity => null;

  @override
  num? get cardRating => null;

  @override
  String get cardTitle => query;

  @override
  String? get horizontalCardImage => historyHorizontalCardImage;

  @override
  String get overView => '';

  @override
  String? get type => historyType;

  @override
  ContentType? get contentType => null;
}
