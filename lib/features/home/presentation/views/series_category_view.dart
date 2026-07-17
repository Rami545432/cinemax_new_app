// features/movies/screens/movie_category_screen.dart

import 'package:flutter/material.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/views/base_category_view.dart';
import 'package:movify/features/home/presentation/blocs/series_bloc.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/features/home/presentation/widgets/main_list_card.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

class SeriesCategoryView
    extends
        BaseCategoryView<SeriesBloc, SeriesCategory, SeriesEntity, NoParams> {
  const SeriesCategoryView({
    super.key,
    required super.initialCategory, // which category to show
  });

  // ── 1. Tell base how to create the bloc ──────────────────────────
  @override
  SeriesBloc createBloc(BuildContext context) => getIt<SeriesBloc>();

  // ── 2. Tell base what a list item looks like ─────────────────────
  @override
  Widget buildListItem(BuildContext context, SeriesEntity item) => MainListCard(
    cardData: item.toCardDisplay(),
    category: initialCategory.name,
  );

  // ── 3. Tell base what a grid item looks like ─────────────────────
  @override
  Widget buildGridItem(BuildContext context, SeriesEntity item) =>
      MainVerticalCard(cardData: item.toCardDisplay());

  // ── Optional — override the AppBar title ─────────────────────────
  @override
  String screenTitle(BuildContext context) =>
      initialCategory.localizedName(context);
}
