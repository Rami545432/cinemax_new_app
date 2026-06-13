import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/details/domain/value_objects/genre.dart';
import 'package:movify/features/details/presentation/widgets/shared/gener_box.dart';
import 'package:movify/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';

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
    return SizedBox(
      height: 57,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.pushNamed(
              RouteName.genreSeeAll,
              extra: GenreSeeAllArguments(
                category: genreCategory,
                genreId: geners[index].id ?? 28,
              ),
            );
          },
          child: GenerBox(gener: geners[index].name),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: geners.length,
      ),
    );
  }
}
