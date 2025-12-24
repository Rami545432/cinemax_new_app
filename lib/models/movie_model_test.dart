import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';

class MovieModelTest extends MovieEntity {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieModelTest({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  }) : super(
         movieId: 0,
         movieTitle: '',
         gener: [],
         movieRating: 0,
         date: '',
         moviePosterImage: '',
         horizentalImage: '',
         storyLine: '',
         moviePopularity: 0,
       );

  factory MovieModelTest.fromJson(Map<String, dynamic> json) => MovieModelTest(
    page: json['page'] as int,
    results: json['results'] as List<MovieModel>,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
  );
  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };
}
