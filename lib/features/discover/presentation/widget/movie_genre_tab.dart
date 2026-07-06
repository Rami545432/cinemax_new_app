import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/ads/banner_ad_widget.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/discover/core/enum/movie_genre.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/presentation/core/collection_list_model.dart';
import 'package:movify/features/discover/presentation/widget/collection_grid_builder.dart';
import 'package:movify/features/discover/presentation/widget/genre_tab_section.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/sub_bar.dart';

class MovieGenreTab extends StatelessWidget {
  const MovieGenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          GenreTabSection(
            title: l10n.movieGenres,
            names: MovieGenre.values
                .map((e) => e.localizedText(context))
                .toList(),
            genreIds: MovieGenre.values.map((e) => e.id).toList(),
            category: GenreCategory.movies,
          ),
          const SizedBox(height: 24),
          SubBar(title: l10n.collections),
          const SizedBox(height: 16),
          Expanded(
            child: CollectionGridBuilder(
              collections: CollectionListModel.movieCollections(context),
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouteName.forceUpdateScreen);
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          const BannerAdWidget(),
        ],
      ),
    );
  }
}
