import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerTvCubit extends Cubit<int> {
  GenerTvCubit() : super(0);

  final List<List<SeriesEntity>> seriesLists = List.generate(5, (_) => []);
  void selectTvGener(int index) {
    emit(index);
  }

  void addTvShowsToGener(int index, SeriesEntity series) {
    seriesLists[index].add(series);
  }

  List<SeriesEntity> getSeriesForSelectedGener() => seriesLists[state];
}
