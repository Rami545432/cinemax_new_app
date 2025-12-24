import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/keep_alive_wrapper.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/parts_tab_bar_view.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/similar_tab_bar.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_tab_bar_view.dart';
import 'cast_tab_bar_view.dart';
import 'movie_about_tab_view.dart';
import 'recomended_tab_bar_view.dart';
import 'reviews_list_view_builder.dart';

class MovieDetailComponets extends StatelessWidget {
  const MovieDetailComponets({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetailsEntity = context.watch<MovieDetailsEntity>();
    final reviews = movieDetailsEntity.kReviews;
    final watchProviders = movieDetailsEntity.kWatchProviders?.results;
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TabBarView(
        children: [
          KeepAliveWrapper(
            child: AboutTabBarView(
              overview: movieDetailsEntity.overView,
              genreCategory: GenreCategory.movies,
              geners: movieDetailsEntity.kGeners,
              watchProviders: watchProviders,
              child: MovieAboutTabView(),
            ),
          ),
          KeepAliveWrapper(
            child: CastTabBarView(actorList: movieDetailsEntity.actorName),
          ),

          KeepAliveWrapper(
            child: movieDetailsEntity.kBelongsToCollection?.id != null
                ? PartsTabBarView(
                    collectionId:
                        movieDetailsEntity.kBelongsToCollection?.id ?? 0,
                    movieId: movieDetailsEntity.movieId,
                  )
                : Center(
                    child: Text(
                      'No collection found',
                      style: AppStyles.textStyle18(context),
                    ),
                  ),
          ),
          KeepAliveWrapper(
            child: reviews!.results!.isNotEmpty
                ? ReviewListViewBuilder(reviews: movieDetailsEntity.kReviews!)
                : Center(
                    child: Text(
                      l10n.noReviewsAvailable,
                      style: AppStyles.textStyle16(context),
                    ),
                  ),
          ),

          KeepAliveWrapper(
            child: RecomendedTabBarView(
              category: RecomendedCategory.movie,
              contentId: movieDetailsEntity.movieId,
            ),
          ),
          KeepAliveWrapper(
            child: SimilarTabBarView(
              category: SimilarCategory.movie,
              contentId: movieDetailsEntity.movieId,
            ),
          ),
        ],
      ),
    );
  }
}
