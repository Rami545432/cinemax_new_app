import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant.dart';
import '../../../../features/series/domain/entites/series_entity.dart';

class GenerTvCubit extends Cubit<int> {
  GenerTvCubit() : super(0);

  final List<List<SeriesEntity>> seriesLists = List.generate(
    buttonTexts.length,
    (_) => [],
  );
  void selectTvGener(int index) {
    emit(index);
  }

  void addTvShowsToGener(int index, SeriesEntity series) {
    seriesLists[index].add(series);
  }

  List<SeriesEntity> getSeriesForSelectedGener() {
    return seriesLists[state];
  }
}
