import 'package:flutter/material.dart';
import 'package:movify/core/ads/banner_ad_widget.dart';
import 'package:movify/features/discover/core/enum/tv_genre.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/presentation/core/collection_list_model.dart';
import 'package:movify/features/discover/presentation/widget/collection_grid_builder.dart';
import 'package:movify/features/discover/presentation/widget/genre_tab_section.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/sub_bar.dart';

class SeriesGenreTab extends StatelessWidget {
  const SeriesGenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 24),
          GenreTabSection(
            title: l10n.tvGenres,
            names: TvGenre.values.map((e) => e.localizedText(context)).toList(),
            genreIds: TvGenre.values.map((e) => e.id).toList(),
            category: GenreCategory.tv,
          ),
          const SizedBox(height: 24),
          SubBar(title: l10n.collections),
          const SizedBox(height: 16),
          Expanded(
            child: CollectionGridBuilder(
              collections: CollectionListModel.tvCollections(context),
            ),
          ),
          const Center(child: BannerAdWidget()),
        ],
      ),
    );
  }
}
