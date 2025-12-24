import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';

class TestEntity {
  final int kPage;
  final List<MovieModel> kResults;
  final int kTotalPages;
  final int kTotalResults;

  TestEntity({
    required this.kPage,
    required this.kResults,
    required this.kTotalPages,
    required this.kTotalResults,
  });
}
