import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/domain/use_cases/no_params.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:movify/core/pagination/widgets/category_row.dart';
import 'package:movify/core/pagination/widgets/horizontal_paginated_list_view.dart';
import 'package:movify/features/home/presentation/blocs/series_bloc.dart';
import 'package:movify/features/home/presentation/blocs/series_bloc_types.dart';
import 'package:movify/features/home/presentation/enums/seires_category.dart';
import 'package:movify/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:movify/features/home/presentation/views/series_category_view.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:movify/features/home/presentation/widgets/stacked_cards_carousel/stacked_cards_carousel.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

class SeriesCategoryRow extends StatefulWidget {
  final SeriesBloc bloc;
  final SeriesCategory category;

  const SeriesCategoryRow({
    super.key,
    required this.bloc,
    required this.category,
  });

  @override
  State<SeriesCategoryRow> createState() => _SeriesCategoryRowState();
}

class _SeriesCategoryRowState extends State<SeriesCategoryRow>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    widget.bloc.add(LoadCategoryEvent(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SeriesBloc, SeriesBlocState>(
      bloc: widget.bloc,
      buildWhen: (prev, curr) {
        if (prev is! SeriesBlocLoaded || curr is! SeriesBlocLoaded) {
          return true;
        }
        return prev.getPaginationInfo(widget.category) !=
            curr.getPaginationInfo(widget.category);
      },
      builder: (context, state) {
        final info = state is SeriesBlocLoaded
            ? state.getPaginationInfo(widget.category)
            : const PaginationInfo<SeriesEntity, NoParams>();

        return CategoryRow<SeriesEntity>(
          title: widget.category.localizedName(context),
          info: info,
          onVisible: () => widget.bloc.add(LoadCategoryEvent(widget.category)),
          showHeader: widget.category != SeriesCategory.trending,
          onSeeAll: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) =>
                  SeriesCategoryView(initialCategory: widget.category),
            ),
          ),

          // ── The only place that knows about trending ─────
          contentBuilder: (context, info) => switch (widget.category) {
            SeriesCategory.trending => StackedCardsCarousel(
              cardModel: info.items.map((e) => e.toCardDisplay()).toList(),
            ),
            _ => HorizontalPaginatedList<SeriesEntity>(
              info: info,
              itemBuilder: (context, series, enableHero) => MainVerticalCard(
                cardData: series.toCardDisplay(),
                enableHero: enableHero,
                category: widget.category.localizedName(context),
              ),
              onScrollEnd: () =>
                  widget.bloc.add(LoadNextPageEvent(widget.category)),
              onRetry: () =>
                  widget.bloc.add(LoadCategoryEvent(widget.category)),
            ),
          },
        );
      },
    );
  }
}
