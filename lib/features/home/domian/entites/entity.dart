import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/enums/content_type.dart';
import '../../../../models/base_card_model.dart';
part 'entity.g.dart';

@HiveType(typeId: 32)
class MovieEntity implements BaseCardModel {
  @HiveField(0)
  final String movieTitle;
  @HiveField(1)
  final List<int> gener;
  @HiveField(2)
  final num movieRating;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String moviePosterImage;
  @HiveField(5)
  final int movieId;
  @HiveField(6)
  final String horizentalImage;
  @HiveField(7)
  final String storyLine;
  @HiveField(8)
  final num moviePopularity;

  const MovieEntity({
    required this.movieTitle,
    required this.gener,
    required this.movieId,
    required this.movieRating,
    required this.date,
    required this.moviePosterImage,
    required this.horizentalImage,
    required this.storyLine,
    required this.moviePopularity,
  });

  @override
  String? get cardDate => date;

  @override
  List<int>? get cardGeners => gener;

  @override
  int get cardId => movieId;

  @override
  String get cardImage => moviePosterImage;

  @override
  num? get cardRating => movieRating;

  @override
  String get cardTitle => movieTitle;

  @override
  String? get horizontalCardImage => horizentalImage;

  @override
  String get overView => storyLine;

  @override
  String? get type => 'movie';

  @override
  num? get cardPopularity => moviePopularity;

  @override
  ContentType? get contentType => ContentType.movies;
}
