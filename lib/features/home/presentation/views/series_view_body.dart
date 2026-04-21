import 'package:cinemax_app_new/core/utils/pagination/presentation/views/base_home_view.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/series_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/seires_category.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/series_category_row.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter/material.dart';


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
