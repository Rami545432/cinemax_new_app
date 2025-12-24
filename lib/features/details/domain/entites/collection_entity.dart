import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/data/models/collection_model/part.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';

class CollectionEntity implements BaseCardModel {
  final int collectionId;
  final String collectionName;
  final String collectionPosterPath;
  final String collectionBackdropPath;
  final String collectionOverview;
  final List<Parts> collectionParts;

  CollectionEntity({
    required this.collectionId,
    required this.collectionName,
    required this.collectionPosterPath,
    required this.collectionBackdropPath,
    required this.collectionOverview,
    required this.collectionParts,
  });
  @override
  int get cardId => collectionId;
  @override
  String get cardImage => collectionPosterPath;
  @override
  String get cardTitle => collectionName;
  @override
  String? get horizontalCardImage => collectionBackdropPath;
  @override
  String? get type => 'collection';
  @override
  num? get cardRating => null;
  @override
  num? get cardPopularity => null;
  @override
  List<int>? get cardGeners => null;
  @override
  String? get cardDate => null;
  @override
  ContentType? get contentType => ContentType.movies;
}
