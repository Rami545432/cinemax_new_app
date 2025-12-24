import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_image_size.dart';
import 'package:cinemax_app_new/core/types/series_view_types.dart';
import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/horizontal_film_card_widgets/stacked_cards_carousel.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/seires_category.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesBLocBuilder extends StatelessWidget {
  const SeriesBLocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<SeriesViewCubit, SeriesViewState>(
      builder: (context, state) {
        if (state is SeriesViewLoaded) {
          final isLoading =
              state.isLoading(SeriesCategory.trending) ||
              state.isInitialLoad(SeriesCategory.trending);
          return RefreshIndicator(
            color: AppPrimaryColors.blueAccent,
            onRefresh: () async =>
                await context.read<SeriesViewCubit>().loadAllCategories(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  // SearchBarButton(),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppPrimaryColors.blueAccent,
                          ),
                        )
                      : StackedCardsCarousel(
                          cardModel: state.getItems(SeriesCategory.trending),
                        ),
                  SeriesPaginatedItem(
                    category: SeriesCategory.popular,
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
                  SeriesPaginatedItem(
                    category: SeriesCategory.airingToday,
                    title: l10n.airingToday,

                    itemBuilder: (item) => MainVerticalCard(
                      posterImage: tmdbImageSize(
                        TmdbImageSize.w300,
                        item.cardImage,
                      ),
                      title: item.cardTitle,
                      rating: item.cardRating ?? 0,
                      id: item.cardId,
                      type: item.type,
                      category: l10n.airingToday,
                    ),
                  ),

                  SeriesPaginatedItem(
                    category: SeriesCategory.topRated,
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
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
