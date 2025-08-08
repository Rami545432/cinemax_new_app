import '../../../../../series/data/models/series_details_model/season.dart';

class SeasonViewArgument {
  final int id;
  final Season season;
  final String? packDropImageUrl;
  final String? posterImageUrl;

  SeasonViewArgument({
    required this.id,
    required this.season,
    this.packDropImageUrl,
    this.posterImageUrl,
  });
}
