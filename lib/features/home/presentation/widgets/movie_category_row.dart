import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:cinemax_app_new/core/utils/pagination/presentation/bloc/new_pagination_info.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/category_row.dart';
import 'package:cinemax_app_new/core/utils/pagination/widgets/horizontal_paginated_list_view.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc_types.dart';
import 'package:cinemax_app_new/features/home/presentation/enums/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/extensions/entity_card_extentions.dart';
import 'package:cinemax_app_new/features/home/presentation/views/movie_category_view.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/features/home/presentation/widgets/stacked_cards_carousel/stacked_cards_carousel.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/use_cases/use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCategoryRow extends StatefulWidget {
  final MovieBloc bloc;
  final MovieCategory category;

  const MovieCategoryRow({
    super.key,
    required this.bloc,
    required this.category,
  });

  @override
  State<MovieCategoryRow> createState() => _MovieCategoryRowState();
}

class _MovieCategoryRowState extends State<MovieCategoryRow> with AutomaticKeepAliveClientMixin {
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
    return BlocBuilder<MovieBloc, MovieBlocState>(
    bloc: widget.bloc,
    buildWhen: (prev, curr) {
      if (prev is! MovieLoadedState || curr is! MovieLoadedState) {
        return true;
      }
      return prev.getPaginationInfo(widget.category) !=
          curr.getPaginationInfo(widget.category);
    },
    builder: (context, state) {
      final info = state is MovieLoadedState
          ? state.getPaginationInfo(widget.category)
          : const PaginationInfo<MovieEntity, NoParams>();

      return CategoryRow<MovieEntity>(
        title: widget.category.localizedName(context),
        info: info,
        onVisible: () {
          final alreadyStarted =
              info.hasData ||
              info.isFetchingFirstPage ||
              info.firstPageError != null;

          if (!alreadyStarted) {
            widget.bloc.add(LoadCategoryEvent(widget.category));
          }
        },
        showHeader: widget.category != MovieCategory.trending,
        onSeeAll: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => MovieCategoryView(initialCategory: widget.category),
          ),
        ),

        // ── The only place that knows about trending ─────
        contentBuilder: (context, info) => switch (widget.category) {
          MovieCategory.trending => StackedCardsCarousel(
            cardModel: info.items.map((e) => e.toCardDisplay()).toList(),
          ),
          _ => HorizontalPaginatedList<MovieEntity>(
            info: info,
            itemBuilder: (context, movie, enableHero) => MainVerticalCard(
              cardData: movie.toCardDisplay(),
              enableHero: enableHero,

              category: widget.category.localizedName(context),
            ),
            onScrollEnd: () =>
                widget.bloc.add(LoadNextPageEvent(widget.category)),
            onRetry: () => widget.bloc.add(LoadCategoryEvent(widget.category)),
          ),
        },
      );
    },
  );
}
}
