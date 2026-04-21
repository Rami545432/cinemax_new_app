import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class LocalHomeDataSource {
  Future<List<MovieEntity>> fetchMostPopularMovies({int page = 10});
  Future<List<MovieEntity>> fetchNewsetMovies();
}

class LocalHomeDataSourceImpl extends LocalHomeDataSource {
  @override
  Future<List<MovieEntity>> fetchMostPopularMovies({int page = 10}) async {
    final int startIndex = (page - 1) * 20;
    int endIndex = startIndex + 20;
    final cachedPopMovies = Hive.box<MovieEntity>('');

    final length = cachedPopMovies.values.length;
    if (startIndex >= length) {
      return [];
    }

    endIndex = endIndex > length ? length : endIndex;

    return cachedPopMovies.values.toList().sublist(startIndex, endIndex);
  }

  @override
  Future<List<MovieEntity>> fetchNewsetMovies() async {
    final cachedNewsetMovies = Hive.box<MovieEntity>('');
    return cachedNewsetMovies.values.toList();
  }
}
