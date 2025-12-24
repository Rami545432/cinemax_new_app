import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        final routeName = cardModel.contentType == ContentType.movies
            ? RouteName.movieDetail
            : RouteName.tvDetail;
        BlocProvider.of<SearchCubit>(context).addToSearchHistory(
          SearchHistoryModel(
            date: cardModel.cardDate ?? '',
            id: cardModel.cardId,
            query: cardModel.cardTitle,
            historyType: cardModel.type ?? 'movie',
            historyHorizontalCardImage: cardModel.horizontalCardImage ?? '',
            historyVerticalCardImage: cardModel.cardImage,
            historyContentType: cardModel.contentType,
          ),
        );
        context.pushNamed(
          routeName,
          pathParameters: {'id': cardModel.cardId.toString()},
          queryParameters: {
            'heroTag': 'search-${cardModel.cardId}',
            'posterImage': cardModel.cardImage,
          },
        );
      },
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: CardImageAndRating(
              posterImage: tmdbImageSize(
                TmdbImageSize.w300,
                cardModel.cardImage,
              ),
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
