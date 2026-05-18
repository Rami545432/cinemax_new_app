import 'package:flutter/material.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/views/base_home_view.dart';
import 'package:movify/features/home/presentation/blocs/series_bloc.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/features/home/presentation/widgets/series_category_row.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

class SeriesViewBody
    extends BaseHomeScreen<SeriesBloc, SeriesCategory, SeriesEntity, NoParams> {
  const SeriesViewBody({super.key});

  @override
  Widget buildCategoryRow(
    BuildContext context,
    SeriesBloc bloc,
    SeriesCategory category,
  ) => SeriesCategoryRow(bloc: bloc, category: category);

  @override
  List<SeriesCategory> get categories => SeriesCategory.values;
}
