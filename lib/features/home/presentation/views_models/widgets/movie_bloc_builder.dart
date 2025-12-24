import 'package:cinemax_app_new/config/animations/widgets/animated_page_transition.dart';
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/types/home_view_types.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/horizontal_film_card_widgets/stacked_cards_carousel.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBlocBuilder extends StatelessWidget {
  const MovieBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieViewCubit, HomeViewState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);

        if (state is HomeViewLoaded) {
          final isLoading =
              state.isLoading(MovieCategory.trending) ||
              state.isInitialLoad(MovieCategory.trending);
          return RefreshIndicator(
            color: AppPrimaryColors.blueAccent,
            onRefresh: () async =>
                await context.read<MovieViewCubit>().loadAllCategories(),
            child: AnimatedPageTransition(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppPrimaryColors.blueAccent,
                            ),
                          )
                        : StackedCardsCarousel(
                            cardModel: state.getItems(MovieCategory.trending),
                          ),
                    HomePaginatedItem(
                      category: MovieCategory.popular,
                      title: l10n.popular,

                      itemBuilder: (item) => MainVerticalCard(
                        posterImage: tmdbImageSize(
                          TmdbImageSize.w300,
                          item.cardImage,
                        ),
                        title: item.cardTitle,
                        rating: item.cardRating ?? 0,
                        id: item.cardId,
                        type: item.type,
                        category: l10n.popular,
                      ),
                    ),
                    HomePaginatedItem(
                      category: MovieCategory.upcoming,
                      title: l10n.upcoming,

                      itemBuilder: (item) => MainVerticalCard(
                        posterImage: tmdbImageSize(
                          TmdbImageSize.w300,
                          item.cardImage,
                        ),
                        title: item.cardTitle,
                        rating: item.cardRating ?? 0,
                        id: item.cardId,
                        type: item.type,
                        category: l10n.upcoming,
                      ),
                    ),
                    HomePaginatedItem(
                      category: MovieCategory.nowPlaying,
                      title: l10n.nowPlaying,

                      itemBuilder: (item) => MainVerticalCard(
                        posterImage: tmdbImageSize(
                          TmdbImageSize.w300,
                          item.cardImage,
                        ),
                        title: item.cardTitle,
                        rating: item.cardRating ?? 0,
                        id: item.cardId,
                        type: item.type,
                        category: l10n.nowPlaying,
                      ),
                    ),
                    HomePaginatedItem(
                      category: MovieCategory.topRated,
                      title: l10n.topRated,
                      itemBuilder: (item) => MainVerticalCard(
                        posterImage: tmdbImageSize(
                          TmdbImageSize.w300,
                          item.cardImage,
                        ),
                        title: item.cardTitle,
                        rating: item.cardRating ?? 0,
                        id: item.cardId,
                        type: item.type,
                        category: l10n.topRated,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Center(child: Text('Unknown state'));
      },
    );
  }
}
