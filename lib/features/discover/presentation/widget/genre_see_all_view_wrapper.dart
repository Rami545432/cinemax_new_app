import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/utils/helper/get_gener_name.dart';
import 'package:cinemax_app_new/features/discover/core/types/genre_types.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubit/genre_content_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenreSeeAllWrapper extends StatefulWidget {
  final GenreSeeAllArguments arguments;

  const GenreSeeAllWrapper({super.key, required this.arguments});

  @override
  State<GenreSeeAllWrapper> createState() => _GenreSeeAllWrapperState();
}

class _GenreSeeAllWrapperState extends State<GenreSeeAllWrapper> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<GenreContentCubit>();
    cubit.loadGenre(
      contentType: widget.arguments.category,
      params: GenreFilterParams(genreId: widget.arguments.genreId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenreSeeAllView(
      category: widget.arguments.category,
      genreId: widget.arguments.genreId,
      title: getGenreName(widget.arguments.genreId, context),
      itemBuilder: (item) => MainVerticalCard(
        posterImage: tmdbImageSize(TmdbImageSize.w300, item.cardImage),
        title: item.cardTitle,
        rating: item.cardRating ?? 0,
        id: item.cardId,
        type: item.type,
        category: '',
      ),
    );
  }
}
