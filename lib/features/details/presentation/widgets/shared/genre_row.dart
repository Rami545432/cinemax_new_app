import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gener_box.dart';

class GenreRow extends StatelessWidget {
  const GenreRow({
    super.key,
    required this.geners,
    required this.genreCategory,
  });

  final List<Genre> geners;
  final GenreCategory genreCategory;
  @override
  Widget build(BuildContext context) {
    if (geners.isEmpty) {
      return const Center(child: Text('No genres found'));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: geners.asMap().entries.map((gener) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteName.genreSeeAll,
                extra: GenreSeeAllArguments(
                  category: genreCategory,
                  genreId: gener.value.id ?? 28,
                ),
              );
            },
            child: GenerBox(gener: gener.value.name),
          ),
        );
      }).toList(),
    );
  }
}
