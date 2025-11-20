import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:hive/hive.dart';

part 'search_history_model.g.dart';

@HiveType(typeId: 2)
class SearchHistoryModel implements BaseCardModel {
  @HiveField(0)
  final String query;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String historyType;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String historyHorizontalCardImage;
  @HiveField(5)
  final String historyVerticalCardImage;
  @HiveField(6)
  final ContentType? historyContentType;

  SearchHistoryModel({
    required this.query,
    required this.date,
    required this.historyType,
    required this.id,
    required this.historyHorizontalCardImage,
    required this.historyVerticalCardImage,
    this.historyContentType,
  });

  @override
  String? get cardDate => date;

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
  String? get type => historyType;

  @override
  ContentType? get contentType => historyContentType;
}
