import 'package:cinemax_app_new/features/details/data/models/collection_model/part.dart';
import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';

class CollectionModel extends CollectionEntity {
  final int? id;
  final String? name;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? backdropPath;
  final String? posterPath;
  final List<Parts>? parts;

  CollectionModel({
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.backdropPath,
    this.posterPath,
    this.parts,
  }) : super(
         collectionId: id ?? 0,
         collectionName: name ?? '',
         collectionPosterPath: posterPath ?? '',
         collectionBackdropPath: backdropPath ?? '',
         collectionOverview: overview ?? '',
         collectionParts: parts ?? [],
       );

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Parts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() => {
    'backdrop_path': backdropPath,
    'poster_path': posterPath,
    'name': name,
    'id': id,
    'original_language': originalLanguage,
    'original_name': originalName,
    'overview': overview,
    'parts': parts,
  };
}
