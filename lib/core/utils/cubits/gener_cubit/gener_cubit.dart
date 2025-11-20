import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/home/domian/entites/movie_entity.dart';

class GenerCubit extends Cubit<int> {
  GenerCubit() : super(0);

  final List<List<MovieEntity>> movieLists = List.generate(
    6,
    (_) => [],
  ); // Adjust size based on genres

  void selectGenre(int index) {
    emit(index);
  }

  void addMoviesToGenre(int index, MovieEntity movies) {
    movieLists[index].add(movies);
    emit(index);
  }

  // Method to get movies for the selected genre
  List<MovieEntity> getMoviesForSelectedGenre() {
    return movieLists[state]; // Return movies for the currently selected genre
  }
}
