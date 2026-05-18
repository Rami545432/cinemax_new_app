import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/home/presentation/extensions/main_vertical_card_extention.dart';
import 'package:movify/features/home/presentation/widgets/card_image_and_rating.dart';
import 'package:movify/features/home/presentation/widgets/card_title.dart';
import 'package:movify/features/search/domain/entities/search_history_entity.dart';
import 'package:movify/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:movify/shared/presentation/models/card_display_model.dart';

class SearchVerticalCard extends StatelessWidget {
  const SearchVerticalCard({super.key, required this.cardModel});
  final CardDisplayModel cardModel;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      developer.log(cardModel.title);
      final routeName = cardModel.contentType == ContentType.movies
          ? RouteName.movieDetail
          : RouteName.tvDetail;
      context.read<SearchHistoryCubit>().addToHistory(
        SearchHistoryEntity(
          id: cardModel.id,
          title: cardModel.title,
          searchedAt: DateTime.now(),
          posterPath: cardModel.posterPath,
          historyContentType: cardModel.contentType,
          rating: cardModel.rating ?? 0,
          date: cardModel.date ?? "",
        ),
      );
      context.pushNamed(
        routeName,
        extra: cardModel.toNavigationData(),
        pathParameters: {'id': cardModel.id.toString()},
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
              cardModel.posterPath,
            ),
            rating: cardModel.rating ?? 0,
          ),
        ),
        CardTitle(title: cardModel.title),
        const SizedBox(),
      ],
    ),
  );
}
