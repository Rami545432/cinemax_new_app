import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

class MovieEntity implements BaseCardModel {
  final String movieTitle;

  final List<int> gener;

  final double movieRating;

  final String date;

  final String moviePosterImage;

  final int movieId;

  final String horizentalImage;

  final String storyLine;

  final double moviePopularity;

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
  @override
  String? get type => 'movie';

  @override
  num? get cardPopularity => moviePopularity;

  @override
  ContentType? get contentType => ContentType.movies;
}
