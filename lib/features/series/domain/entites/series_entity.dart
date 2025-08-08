import '../../../../core/utils/enums/content_type.dart';
import '../../../../models/base_card_model.dart';

class SeriesEntity implements BaseCardModel {
  final int tvId;

  final String tvTitle;

  final String tvPosterPath;

  final String tvBackDropPath;

  final String tvFirstAirDate;

  final num tvRating;
  final List<int> gener;
  final String storyLine;
  final num tvPopularity;

  const SeriesEntity({
    required this.tvId,
    required this.tvTitle,
    required this.tvPosterPath,
    required this.tvBackDropPath,
    required this.tvFirstAirDate,
    required this.tvRating,
    required this.gener,
    required this.storyLine,
    required this.tvPopularity,
  });

  @override
  String? get cardDate => tvFirstAirDate;

  @override
  List<int>? get cardGeners => gener;

  @override
  int get cardId => tvId;

  @override
  String get cardImage => tvPosterPath;

  @override
  num? get cardRating => tvRating;

  @override
  String get cardTitle => tvTitle;

  @override
  String? get horizontalCardImage => tvBackDropPath;

  @override
  String get overView => storyLine;

  @override
  String? get type => 'tv';

  @override
  num? get cardPopularity => tvPopularity;

  @override
  ContentType? get contentType => ContentType.series;
}
