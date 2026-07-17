import 'package:flutter/material.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/views/base_home_view.dart';
import 'package:movify/features/home/presentation/blocs/movie_bloc.dart';
import 'package:movify/features/home/presentation/enums/movie_category.dart';
import 'package:movify/features/home/presentation/widgets/movie_category_row.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

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
