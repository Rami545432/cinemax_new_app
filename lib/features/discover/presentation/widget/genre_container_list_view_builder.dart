import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenreContainerListViewBuilder extends StatelessWidget {
  const GenreContainerListViewBuilder({
    super.key,
    required this.genreIds,
    required this.names,
    required this.category,
  });
  final List<int> genreIds;
  final List<String> names;
  final GenreCategory category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: names.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                RouteName.genreSeeAll,
                extra: GenreSeeAllArguments(
                  category: category,
                  genreId: genreIds[index],
                ),
              );
            },
            child: GenreContainer(name: names[index]),
          );
        },
      ),
    );
  }
}
