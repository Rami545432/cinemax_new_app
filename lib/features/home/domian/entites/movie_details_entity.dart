import 'package:hive_flutter/hive_flutter.dart';

import '../../../../models/movie_details_model/cast.dart';
import '../../../../models/movie_details_model/credits.dart';
import '../../../../models/movie_details_model/production_company.dart';
import '../../../../models/movie_details_model/production_country.dart';
import '../../../../models/movie_details_model/videos.dart';

part 'movie_details_entity.g.dart';

@HiveType(typeId: 7)
class MovieDetailsEntity {
  @HiveField(0)
  final int? kRevenue;
  @HiveField(1)
  final int? kBudget;
  @HiveField(2)
  final int duration;
  @HiveField(3)
  final List<Cast> actorName;
  @HiveField(4)
  final String movieStatus;
  @HiveField(5)
  final List<ProductionCompany>? companies;
  @HiveField(6)
  final List<ProductionCountry>? countries;
  @HiveField(7)
  final String? kLanguages;
  @HiveField(8)
  final Credits? kCredits;
  @HiveField(9)
  final Videos? kVideos;
  @HiveField(10)
  final String movieTitle;
  @HiveField(11)
  final List<int> genres;
  @HiveField(12)
  final String overView;
  MovieDetailsEntity({
    required this.duration,
    required this.actorName,
    required this.movieStatus,
    this.companies,
    this.kRevenue,
    this.kBudget,
    this.kLanguages,
    this.countries,
    this.kCredits,
    required this.genres,
    required this.overView,
    this.kVideos,
    required this.movieTitle,
  });
}
