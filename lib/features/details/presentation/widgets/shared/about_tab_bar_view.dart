import 'package:flutter/material.dart';
import 'package:movify/config/animations/extensions/widget_animations.dart';
import 'package:movify/features/details/domain/value_objects/genre.dart';
import 'package:movify/features/details/domain/value_objects/results.dart';
import 'package:movify/features/details/presentation/widgets/details_widgets/custom_descreption.dart';
import 'package:movify/features/details/presentation/widgets/shared/about_tab_view_branch.dart';
import 'package:movify/features/details/presentation/widgets/shared/genre_row.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/l10n/app_localizations.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    super.key,
    required this.overview,
    required this.geners,
    required this.child,
    this.watchProviders,
    required this.genreCategory,
  });

  final String overview;
  final List<Genre> geners;
  final Widget child;
  final Results? watchProviders;
  final GenreCategory genreCategory;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CustomDescreption(overview: overview),
        const SizedBox(height: 10),

        const Divider(),
        AboutTabViewBranch(
          title: l10n.geners,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GenreRow(geners: geners, genreCategory: genreCategory),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),

        child,
      ].animateList(),
    );
  }
}
