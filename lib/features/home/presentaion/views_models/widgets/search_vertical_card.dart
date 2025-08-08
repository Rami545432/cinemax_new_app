import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/go_router.dart';
import '../../../../../models/base_card_model.dart';
import '../../../../search/data/models/search_history_model.dart';
import '../../../../search/presentaion/view_models/manger/search_cubit/search_cubit.dart';
import 'card_image_and_rating.dart';
import 'card_title.dart';

class SearchVerticalCard extends StatelessWidget {
  const SearchVerticalCard({super.key, required this.cardModel});
  final BaseCardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<SearchCubit>(context).addToSearchHistory(
          SearchHistoryModel(
            createdAt: DateTime.now(),
            id: cardModel.cardId,
            query: cardModel.cardTitle,
            historyType: cardModel.type ?? 'movie',
            historyHorizontalCardImage: cardModel.horizontalCardImage ?? '',
            historyVerticalCardImage: cardModel.cardImage,
          ),
        );
        GoRouter.of(context).push(AppRouter.kMovieDetailView, extra: cardModel);
      },
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CardImageAndRating(
              imageUrl: cardModel.cardImage,
              rating: cardModel.cardRating ?? 0,
            ),
          ),
          CardTitle(title: cardModel.cardTitle),
          SizedBox(),
        ],
      ),
    );
  }
}
