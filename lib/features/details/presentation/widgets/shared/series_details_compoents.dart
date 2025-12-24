import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/keep_alive_wrapper.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/reviews_list_view_builder.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/series_about_tab_bar_view.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/similar_tab_bar.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/series_details_entity.dart';
import 'about_tab_bar_view.dart';
import 'cast_tab_bar_view.dart';
import 'recomended_tab_bar_view.dart';
import 'season_tab_bar_view.dart';

class SeriesDetailsCompoents extends StatelessWidget {
  const SeriesDetailsCompoents({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.watch<SeriesDetailsEntity>();
    final reviews = seriesDetailsEntity.kReviews;
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TabBarView(
        children: [
          KeepAliveWrapper(
            child: AboutTabBarView(
              overview: seriesDetailsEntity.overView ?? '',
              genreCategory: GenreCategory.tv,
              geners: seriesDetailsEntity.geners ?? [],
              child: SeriesAboutTabBarView(),
            ),
          ),
          KeepAliveWrapper(child: SeasonTabBarView()),
          KeepAliveWrapper(
            child: CastTabBarView(
              actorList: seriesDetailsEntity.actorDetails ?? [],
            ),
          ),

          KeepAliveWrapper(
            child: reviews!.results!.isNotEmpty
                ? ReviewListViewBuilder(reviews: reviews)
                : Center(
                    child: Text(
                      l10n.noReviewsAvailable,
                      style: AppStyles.textStyle16(context),
                    ),
                  ),
          ),
          KeepAliveWrapper(
            child: RecomendedTabBarView(
              category: RecomendedCategory.tv,
              contentId: seriesDetailsEntity.seiresId,
            ),
          ),
          KeepAliveWrapper(
            child: SimilarTabBarView(
              category: SimilarCategory.tv,
              contentId: seriesDetailsEntity.seiresId,
            ),
          ),
        ],
      ),
    );
  }
}
