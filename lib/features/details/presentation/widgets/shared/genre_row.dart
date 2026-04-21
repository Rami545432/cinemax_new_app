import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/details/domain/value_objects/genre.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/shared/gener_box.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:cinemax_app_new/features/discover/domain/entities/genre_filter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      children: geners
          .asMap()
          .entries
          .map(
            (gener) => Padding(
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
            ),
          )
          .toList(),
    );
  }
}
