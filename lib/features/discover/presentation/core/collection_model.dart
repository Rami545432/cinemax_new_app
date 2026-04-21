import 'package:cinemax_app_new/features/discover/presentation/core/enums/type_enum.dart';

class CollectionModel {
  final String name;
  final String imageUrl;
  final String description;
  final TypeEnum type;
  final int keyword;

  CollectionModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.type,
    required this.keyword,
  });
}
