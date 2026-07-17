import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/features/details/presentation/widgets/shared/gener_box.dart';
import 'package:movify/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';

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
  Widget build(BuildContext context) => SizedBox(
    height: 50,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemCount: names.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pushNamed(
            RouteName.genreSeeAll,
            extra: GenreSeeAllArguments(
              category: category,
              genreId: genreIds[index],
            ),
          );
        },
        child: GenerBox(gener: names[index]),
      ),
    ),
  );
}
