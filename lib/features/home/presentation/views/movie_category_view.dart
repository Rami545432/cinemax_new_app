// features/movies/screens/movie_category_screen.dart

import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/views/base_category_view.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/main_list_card.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter/material.dart';

class MovieCategoryView
    extends BaseCategoryView<MovieBloc, MovieCategory, MovieEntity, NoParams> {
  const MovieCategoryView({
    super.key,
    required super.initialCategory, // which category to show
  });

  // ── 1. Tell base how to create the bloc ──────────────────────────
  @override
  MovieBloc createBloc(BuildContext context) => getIt<MovieBloc>();

  // ── 2. Tell base what a list item looks like ─────────────────────
  @override
  Widget buildListItem(BuildContext context, MovieEntity item) =>
      MainListCard(cardData: item.toCardDisplay(), category: initialCategory.name);

  // ── 3. Tell base what a grid item looks like ─────────────────────
  @override
  Widget buildGridItem(BuildContext context, MovieEntity item) =>
      MainVerticalCard(cardData: item.toCardDisplay());

  // ── Optional — override the AppBar title ─────────────────────────
  @override
  String screenTitle(BuildContext context) =>
      initialCategory.localizedName(context);
}
