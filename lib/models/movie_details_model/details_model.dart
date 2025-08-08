import 'cast.dart';
import 'credits.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'videos.dart';

class DetailsModel {
  final List<int>? kGenres;
  final String? kHomepage;
  final List<ProductionCompany>? companies;
  final List<ProductionCountry>? countries;
  final String? kLanguages;
  final List<Cast>? actors;
  final String? kStatus;
  final double? rating;
  final int? duration;
  final int? kRevenue;
  final int? kBudget;
  final Credits? kCredits;
  final Videos? kVideos;

  DetailsModel({
    this.kGenres,
    this.kHomepage,
    this.companies,
    this.countries,
    this.kLanguages,
    this.actors,
    this.kStatus,
    this.rating,
    this.kCredits,
    this.duration,
    this.kBudget,
    this.kRevenue,
    this.kVideos,
  });
}
