import 'package:hive/hive.dart';

import '../../features/home/domian/entites/entity.dart';

void saveMoviesData(List<MovieEntity> movies, String boxname) {
  var popularMovies = Hive.box<MovieEntity>(boxname);
  popularMovies.addAll(movies);
}
