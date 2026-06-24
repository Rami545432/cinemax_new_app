import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/pagination/presentation/bloc/category_pagination_event.dart';
import 'package:movify/core/pagination/widgets/sliver_paginated_grid_view.dart';
import 'package:movify/features/discover/presentation/blocs/fetch_items_by_keywords_bloc.dart';
import 'package:movify/features/discover/presentation/core/collection_model.dart';
import 'package:movify/features/discover/presentation/cubits/fetch_items_by_keywords_states.dart';
import 'package:movify/features/home/presentation/widgets/main_vertical_card.dart';

class ModeViewBodyBlocBuilder extends StatelessWidget {
  const ModeViewBodyBlocBuilder({
    super.key,
    required this.modeModel,
    required this.scrollController,
  });

  final CollectionModel modeModel;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FetchItemsByKeywordsBloc, FetchItemsByKeywordsState>(
        builder: (context, state) {
          if (state is FetchItemsByKeywordsLoaded) {
            final data = state.getPaginationInfo(modeModel.type);
            return SliverPaginatedGridView(
              info: data,
              itemBuilder: (context, cardData) =>
                  MainVerticalCard(cardData: cardData),
              onScrollEnd: () => context.read<FetchItemsByKeywordsBloc>().add(
                LoadNextPageEvent(modeModel.type),
              ),
              onRetry: () => context.read<FetchItemsByKeywordsBloc>().add(
                LoadCategoryEvent(modeModel.type),
              ),
            );
          }

          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator(color: Colors.blue)),
          );
        },
      );
}
