import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/entites/series_details_entity.dart';
import 'package:movify/features/details/domain/enums/recomended_category.dart';
import 'package:movify/features/details/domain/enums/similar_category.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_bar_view.dart';
import 'package:movify/features/details/presentation/widgets/shared/cast_tab_bar_view.dart';
import 'package:movify/features/details/presentation/widgets/shared/recomended_tab_bar_view.dart';
import 'package:movify/features/details/presentation/widgets/shared/reviews_list_view_builder.dart';
import 'package:movify/features/details/presentation/widgets/shared/season_tab_bar_view.dart';
import 'package:movify/features/details/presentation/widgets/shared/series_about_tab_bar_view.dart';
import 'package:movify/features/details/presentation/widgets/shared/similar_tab_bar.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/keep_alive_wrapper.dart';

class SeriesDetailsCompoents extends StatelessWidget {
  const SeriesDetailsCompoents({super.key});

  @override
  Widget build(BuildContext context) {
    final seriesDetailsEntity = context.read<SeriesDetailsEntity>();
    final reviews = seriesDetailsEntity.kReviews;
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TabBarView(
        children: [
          KeepAliveWrapper(
            child: AboutTabBarView(
              overview: seriesDetailsEntity.overView ?? '',
              genreCategory: GenreCategory.tv,
              geners: seriesDetailsEntity.geners ?? [],
              child: const SeriesAboutTabBarView(),
            ),
          ),
          const KeepAliveWrapper(child: SeasonTabBarView()),
          KeepAliveWrapper(
            child: CastTabBarView(
              actorList: seriesDetailsEntity.actorDetails ?? [],
            ),
          ),

          KeepAliveWrapper(
            child: reviews?.results?.isNotEmpty ?? false
                ? ReviewListViewBuilder(reviews: reviews!)
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
