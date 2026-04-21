import 'package:cinemax_app_new/core/utils/pagination/presentation/views/base_home_view.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/movie_category_row.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter/material.dart';


class MovieViewBody
    extends BaseHomeScreen<MovieBloc, MovieCategory, MovieEntity, NoParams> {
  const MovieViewBody({super.key});


  @override
  Widget buildCategoryRow(
    BuildContext context,
    MovieBloc bloc,
    MovieCategory category,
  ) => MovieCategoryRow(bloc: bloc, category: category);

  @override
  List<MovieCategory> get categories => MovieCategory.values;
}
