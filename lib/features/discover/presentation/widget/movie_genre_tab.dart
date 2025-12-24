import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/core/enum/movie_genre.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/demo_page.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_tab_section.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MovieGenreTab extends StatelessWidget {
  const MovieGenreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: [
          SizedBox(height: 24),
          GenreTabSection(
            title: l10n.movieGenres,
            names: MovieGenre.values
                .map((e) => e.localizedText(context))
                .toList(),
            genreIds: MovieGenre.values.map((e) => e.id).toList(),
            category: GenreCategory.movies,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DemoPage()),
              );
            },
            child: Text('Demo Page', style: AppStyles.textStyle16(context)),
          ),
        ],
      ),
    );
  }
}
