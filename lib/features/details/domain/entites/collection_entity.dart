import 'package:cinemax_app_new/features/details/domain/entites/part_entity.dart';

class CollectionEntity {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final List<PartEntity> parts;

  CollectionEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.parts,
  });
  CollectionEntity copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
    String? overview,
    List<PartEntity>? parts,
  }) => CollectionEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    posterPath: posterPath ?? this.posterPath,
    backdropPath: backdropPath ?? this.backdropPath,
    overview: overview ?? this.overview,
    parts: parts ?? this.parts,
  );
}
