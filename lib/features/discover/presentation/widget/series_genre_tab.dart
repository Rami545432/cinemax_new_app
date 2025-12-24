import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/core/enum/tv_genre.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_tab_section.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SeriesGenreTab extends StatelessWidget {
  const SeriesGenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: [
          SizedBox(height: 24),
          GenreTabSection(
            title: l10n.tvGenres,
            names: TvGenre.values.map((e) => e.localizedText(context)).toList(),
            genreIds: TvGenre.values.map((e) => e.id).toList(),
            category: GenreCategory.tv,
          ),
        ],
      ),
    );
  }
}
