import 'package:movify/features/discover/domain/entities/genre_filter.dart';

class GenreSeeAllArguments {
  final GenreCategory category;
  final int genreId;

  const GenreSeeAllArguments({required this.category, required this.genreId});
}
